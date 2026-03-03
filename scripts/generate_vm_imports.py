import boto3
import json
import re
import sys

def sanitize_name(name):
    """Ensure instance name is a valid Terraform map key."""
    return re.sub(r'[^a-zA-Z0-9-_]', '-', name).lower()

def get_instances(endpoint_url=None):
    ec2 = boto3.client('ec2', region_name='us-east-1', endpoint_url=endpoint_url)
    
    # =====================================================================
    # OPTIMIZATION: Bulk fetch all volumes first (Solves the N+1 API Problem)
    # =====================================================================
    print("Caching all Volume metadata (O(1) network calls)...")
    volume_cache = {}
    
    # Try fetching volumes. If Localstack is fresh or there's an error, handle gracefully.
    try:
        vol_paginator = ec2.get_paginator('describe_volumes')
        for vol_page in vol_paginator.paginate():
            for vol in vol_page['Volumes']:
                volume_cache[vol['VolumeId']] = {
                    'size': vol['Size'],
                    'volume_type': vol['VolumeType'],
                    'encrypted': vol.get('Encrypted', False)
                }
    except Exception as e:
        print(f"Warning: Could not fetch volumes: {e}")
            
    # =====================================================================
    # FETCH INSTANCES (Strictly O(N) processing)
    # =====================================================================
    print("Fetching EC2 instances...")
    instances = {}
    paginator = ec2.get_paginator('describe_instances')
    
    try:
        for page in paginator.paginate():
            for reservation in page['Reservations']:
                for instance in reservation['Instances']:
                    if instance['State']['Name'] == 'terminated':
                        continue
                    
                    tags = {tag['Key']: tag['Value'] for tag in instance.get('Tags', [])}
                    raw_name = tags.get('Name', instance['InstanceId'])
                    tf_key = sanitize_name(raw_name)
                    
                    if tf_key in instances:
                        tf_key = f"{tf_key}-{instance['InstanceId'][-5:]}"
                    
                    platform = "windows" if instance.get('Platform') == 'windows' else "linux"
                    
                    iam_profile = ""
                    if 'IamInstanceProfile' in instance:
                        iam_profile = instance['IamInstanceProfile']['Arn'].split('/')[-1]

                    root_device_name = instance.get('RootDeviceName', '')
                    root_volume = None
                    ebs_volumes = {}
                    
                    for bdm in instance.get('BlockDeviceMappings', []):
                        ebs = bdm.get('Ebs', {})
                        if not ebs: continue
                        
                        vol_id = ebs['VolumeId']
                        
                        # OPTIMIZATION: O(1) Dictionary Lookup from memory
                        vol_data = volume_cache.get(vol_id, {'size': 8, 'volume_type': 'gp2', 'encrypted': False})
                        
                        if bdm['DeviceName'] == root_device_name:
                            root_volume = vol_data.copy()
                        else:
                            vol_data_copy = vol_data.copy()
                            vol_data_copy['device_name'] = bdm['DeviceName']
                            clean_dev = sanitize_name(bdm['DeviceName'])
                            ebs_volumes[clean_dev] = vol_data_copy

                    if not root_volume:
                        root_volume = {'size': 8, 'volume_type': 'gp2', 'encrypted': False}

                    instances[tf_key] = {
                        'id': instance['InstanceId'],
                        'tf_config': {
                            'ami': instance['ImageId'],
                            'instance_type': instance['InstanceType'],
                            'subnet_id': instance.get('SubnetId', 'subnet-mock'),
                            'security_group_ids': [sg['GroupId'] for sg in instance.get('SecurityGroups', [])],
                            'key_name': instance.get('KeyName', ''),
                            'iam_instance_profile': iam_profile,
                            'tags': tags,
                            'platform': platform,
                            'root_volume': root_volume,
                            'ebs_volumes': ebs_volumes
                        }
                    }
    except Exception as e:
         print(f"Error fetching instances: {e}")
    
    return instances

def generate_files(instances):
    tfvars_path = '../env/dev/vm_instances.auto.tfvars.json'
    imports_path = '../env/dev/vm_imports.tf'
    
    tfvars_data = {'vm_instances': {}}
    for key, data in instances.items():
        tfvars_data['vm_instances'][key] = data['tf_config']
        
    with open(tfvars_path, 'w') as f:
        json.dump(tfvars_data, f, indent=2)
        
    with open(imports_path, 'w') as f:
        f.write("# AUTO-GENERATED - DELETE AFTER SUCCESSFUL IMPORT\n\n")
        for key, data in instances.items():
            f.write("import {\n")
            f.write(f'  to = module.infrastructure.module.vm["{key}"].aws_instance.this\n')
            f.write(f'  id = "{data["id"]}"\n')
            f.write("}\n\n")

    print(f"Generated {len(instances)} VM configurations in {tfvars_path}")

if __name__ == "__main__":
    # Pointing to LocalStack by default for our mock run
    # Usage: python generate_vm_imports.py [endpoint_url]
    endpoint = "http://localhost:4566"
    if len(sys.argv) > 1:
        endpoint = sys.argv[1]
    
    print(f"Using endpoint: {endpoint}")
    instances = get_instances(endpoint_url=endpoint)
    generate_files(instances)
