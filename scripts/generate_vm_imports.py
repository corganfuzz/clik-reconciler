import boto3
import json
import re
import sys
import time
from pathlib import Path
from typing import Optional, Any


def sanitize_name(name: str) -> str:
    return re.sub(r"[^a-zA-Z0-9-_]", "-", name).lower()


def build_volume_cache(ec2) -> dict:
    """
    Bulk-fetch all EBS volume metadata to solve the N+1 API Query Problem.
    Returns: { volume_id: { size, volume_type, encrypted } }
    """
    print("Caching all Volume metadata (O(1) network calls)...")
    cache: dict = {}
    try:
        paginator = ec2.get_paginator("describe_volumes")
        for page in paginator.paginate():
            for vol in page["Volumes"]:
                cache[vol["VolumeId"]] = {
                    "size": vol["Size"],
                    "volume_type": vol["VolumeType"],
                    "encrypted": vol.get("Encrypted", False),
                }
    except Exception as e:
        print(f"Warning: Could not fetch volumes: {e}")
    return cache


def parse_block_devices(instance: dict, volume_cache: dict) -> tuple:
    """Classify block device mappings into root volume and extra EBS volumes."""

    root_device_name = instance.get("RootDeviceName", "")
    root_volume = None
    ebs_volumes: dict = {}
    default_vol = {"size": 8, "volume_type": "gp2", "encrypted": False}

    for bdm in instance.get("BlockDeviceMappings", []):

        ebs = bdm.get("Ebs", {})

        if not ebs:
            continue
        vol_data = volume_cache.get(ebs["VolumeId"], default_vol).copy()

        if bdm["DeviceName"] == root_device_name:
            root_volume = vol_data
        else:
            vol_data["device_name"] = bdm["DeviceName"]
            ebs_volumes[sanitize_name(bdm["DeviceName"])] = vol_data

    return (root_volume or default_vol.copy(), ebs_volumes)


def parse_instance(instance: dict, volume_cache: dict, seen_keys: set) -> tuple:
    """Extract configuration from an EC2 instance, returning (tf_key, {id, tf_config})."""

    tags = {tag["Key"]: tag["Value"] for tag in instance.get("Tags", [])}
    tf_key = sanitize_name(tags.get("Name", instance["InstanceId"]))

    # Deduplicate keys for instances that share a Name tag
    if tf_key in seen_keys:
        tf_key = f"{tf_key}-{instance['InstanceId'][-5:]}"

    iam_profile = ""
    if "IamInstanceProfile" in instance:
        iam_profile = instance["IamInstanceProfile"]["Arn"].split("/")[-1]

    platform = "windows" if instance.get("Platform") == "windows" else "linux"
    root_volume, ebs_volumes = parse_block_devices(instance, volume_cache)

    return tf_key, {
        "id": instance["InstanceId"],
        "tf_config": {
            "ami": instance["ImageId"],
            "instance_type": instance["InstanceType"],
            "subnet_id": instance.get("SubnetId", "subnet-mock"),
            "security_group_ids": [
                sg["GroupId"] for sg in instance.get("SecurityGroups", [])
            ],
            "key_name": instance.get("KeyName", ""),
            "iam_instance_profile": iam_profile,
            "tags": tags,
            "platform": platform,
            "root_volume": root_volume,
            "ebs_volumes": ebs_volumes,
        },
    }


def get_instances(endpoint_url: Optional[str] = None) -> dict:

    ec2 = boto3.client("ec2", region_name="us-east-1", endpoint_url=endpoint_url)
    volume_cache = build_volume_cache(ec2)

    print("Fetching EC2 instances...")
    instances: dict = {}
    seen_keys: set = set()

    try:
        paginator = ec2.get_paginator("describe_instances")
        for page in paginator.paginate():
            for reservation in page["Reservations"]:
                for instance in reservation["Instances"]:
                    if instance["State"]["Name"] == "terminated":
                        continue
                    tf_key, data = parse_instance(instance, volume_cache, seen_keys)
                    seen_keys.add(tf_key)
                    instances[tf_key] = data
    except Exception as e:
        print(f"Error fetching instances: {e}")

    return instances


def _format_dict(obj: dict, pad: str, indent: int) -> str:
    if not obj:
        return "{}"
    lines = []
    for k, v in obj.items():
        key = k if re.match(r"^[a-zA-Z_][a-zA-Z0-9_-]*$", k) else json.dumps(k)
        lines.append(f"{pad}  {key} = {dict_to_hcl(v, indent + 2)}")
    return "{\n" + "\n".join(lines) + f"\n{pad}}}"


def _format_list(obj: list, pad: str, indent: int) -> str:
    if not obj:
        return "[]"
    return "[" + ", ".join(dict_to_hcl(i, indent) for i in obj) + "]"


def dict_to_hcl(obj: Any, indent: int = 0) -> str:
    """Format Python objects as valid Terraform HCL (Python 3.9+ compatible)."""

    pad = " " * indent

    # Order matters: bool must be checked before int because True is an instance of int in Python
    if isinstance(obj, bool):
        return "true" if obj else "false"

    dispatch = {
        int: str,
        float: str,
        str: json.dumps,
        list: lambda x: _format_list(x, pad, indent),
        dict: lambda x: _format_dict(x, pad, indent),
        type(None): lambda _: "null",
    }

    # Find the matching type formatter
    for type_obj, formatter in dispatch.items():
        if isinstance(obj, type_obj):
            return formatter(obj)

    return "null"


def generate_files(instances: dict) -> None:

    # Resolve paths robustly relative to the script location
    script_dir = Path(__file__).parent.resolve()
    output_dir = script_dir.parent / "env" / "dev"
    output_dir.mkdir(parents=True, exist_ok=True)

    locals_path = output_dir / "imported_vms.tf"
    imports_path = output_dir / "vm_imports.tf"

    # 1. Generate HCL locals via native generator
    hcl_str = dict_to_hcl({k: v["tf_config"] for k, v in instances.items()}, indent=2)

    with open(locals_path, "w") as f:
        f.write("# AUTO-GENERATED - Migrate these to locals.tf when ready\n")
        f.write("locals {\n")
        f.write(f"  imported_vms = {hcl_str}\n")
        f.write("}\n")

    with open(imports_path, "w") as f:
        f.write("# AUTO-GENERATED - DELETE AFTER SUCCESSFUL IMPORT\n\n")
        for key, data in instances.items():
            f.write("import {\n")
            f.write(
                f'  to = module.infrastructure.module.vm["{key}"].aws_instance.this\n'
            )
            f.write(f'  id = "{data["id"]}"\n')
            f.write("}\n\n")

    print(f"Generated {len(instances)} VM configurations in {locals_path}")
    print(f"Generated {len(instances)} import blocks in {imports_path}")


if __name__ == "__main__":

    endpoint = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:4566"
    print(f"Using endpoint: {endpoint}")

    start = time.perf_counter()
    instances = get_instances(endpoint_url=endpoint)
    generate_files(instances)
    elapsed = time.perf_counter() - start

    print(f"\nDone in {elapsed:.2f}s  ({len(instances)} instances processed)")
