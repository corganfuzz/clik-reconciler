# ClikOps Reconciler

## What Is This?

> [!TIP]
> Get all EC2 instances created manually by people and bring it under terraform management for total control.

This Reconciler discovers every ClickOps EC2 instance in an AWS account, extracts its full configuration (AMI, instance type, volumes, tags, security groups, etc.), and generates the exact Terraform code needed to adopt them — without destroying, recreating, or modifying a single instance.

The end result: every instance is managed as Infrastructure as Code. From that point forward, all changes go through `terraform plan` → `terraform apply` → Git.

---

## How It Works

```
 ┌─────────────────────────────────────────────────┐
 │  INPUT: N unmanaged EC2 instances in AWS         │
 │  (created via Console, CLI, or scripts)          │
 └──────────────────────┬──────────────────────────┘
                        │
                        ▼
 ┌──────────────────────────────────────────────────┐
 │  STEP 1: DISCOVER                                │
 │  generate_vm_imports.py queries the AWS API      │
 │  Bulk-fetches all volumes in O(1) network calls  │
 │  Iterates instances in O(N)                      │
 └──────────────────────┬───────────────────────────┘
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
 ┌────────────────────┐   ┌───────────────────────┐
 │  OUTPUT FILE 1:    │   │  OUTPUT FILE 2:       │
 │  vm_instances      │   │  vm_imports.tf        │
 │  .auto.tfvars.json │   │  (import {} blocks)   │
 └────────┬───────────┘   └───────────┬───────────┘
          │                           │
          └─────────────┬─────────────┘
                        ▼
 ┌──────────────────────────────────────────────────┐
 │  STEP 2: PLAN                                    │
 │  terraform init → terraform plan                 │
 │  Terraform reads both files, matches each import │
 │  block to the module config, confirms 0 drift    │
 └──────────────────────┬───────────────────────────┘
                        │
                        ▼
 ┌──────────────────────────────────────────────────┐
 │  STEP 3: APPLY                                   │
 │  terraform apply                                 │
 │  Terraform writes each instance into state       │
 │  Nothing is created, changed, or destroyed       │
 └──────────────────────┬───────────────────────────┘
                        │
                        ▼
 ┌──────────────────────────────────────────────────┐
 │  RESULT: N instances now in Terraform state      │
 │  vm_imports.tf deleted (one-time use)            │
 │  vm_instances.auto.tfvars.json committed to Git  │
 │  All future changes go through Terraform         │
 └──────────────────────────────────────────────────┘
```

---

## Full Walkthrough (LocalStack Mock Environment)

This walkthrough uses **LocalStack** — an open-source AWS emulator that runs as a Docker container on your machine. It lets you simulate the entire reconciliation pipeline without touching a real AWS account or spending a dollar.

> [!IMPORTANT]
> **Everything below runs on your host machine.** You never exec into the LocalStack container. LocalStack just exposes an API on `localhost:4566` that behaves like AWS.

---

### Step 1 — Recreate the Chaos

For a simulation,we will use LocalStack to recreate the mess. 

Launching 100–1000 EC2 instances that exist in "AWS" but have zero Terraform coverage.

#### 1a. Start LocalStack

Make sure Docker is running, then start a LocalStack container:

```python
docker run --rm -d \
  --name localstack \
  -p 4566:4566 \
  -p 4510-4559:4510-4559 \
  localstack/localstack
```

Wait ~5 seconds for LocalStack to boot, then verify the EC2 service is ready:

```bash
curl -s http://localhost:4566/_localstack/health | python3 -m json.tool
```

You should see `"ec2": "running"` (or `"available"`) in the output.

#### 1b. Install the mock CLI tools

Install `awscli-local` and `boto3` on your **host machine**. `awslocal` is a wrapper around the AWS CLI that automatically points all commands at LocalStack (`localhost:4566`) so you don't have to pass `--endpoint-url` every time. `boto3` is the Python AWS SDK that the reconciler script uses.

```python
pip install awscli-local boto3
```

#### 1c. Seed the instances

Use `awslocal` to create the instances. This simulates an admin clicking "Launch Instance" in the console 100 times:

**For 100 VMs:**
```bash
for i in {1..100}; do
  awslocal ec2 run-instances \
    --image-id ami-12345678 \
    --count 1 \
    --instance-type t2.micro \
    --region us-east-1 \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=mock-server-$i}]"
done
```

**For 1,000 VMs:**
```bash
for i in {1..1000}; do
  awslocal ec2 run-instances \
    --image-id ami-12345678 \
    --count 1 \
    --instance-type t3.large \
    --region us-east-1 \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=prod-vm-$i}]"
done
```

Verify the count:
```bash
awslocal ec2 describe-instances \
  --region us-east-1 \
  --query 'Reservations[*].Instances[*].InstanceId' \
  --output text | wc -w
```

**At this point you have:** N instances running in LocalStack, each with an instance ID, an AMI, an instance type, tags, and security groups. Terraform knows about zero of them.

---

### Step 2 — Run the Reconciler (Discovery + Code Generation)

The script `scripts/generate_vm_imports.py` connects to the AWS API (or LocalStack), discovers every running instance, and generates two Terraform-ready files.

```bash
cd scripts
python3 generate_vm_imports.py
```

The endpoint defaults to `http://localhost:4566` (LocalStack). To point it at a real AWS account or a different endpoint, pass it as an argument:

```python
python3 generate_vm_imports.py https://ec2.us-east-1.amazonaws.com
```

**Terminal output:**
```
Using endpoint: http://localhost:4566
Caching all Volume metadata (O(1) network calls)...
Fetching EC2 instances...
Generated 1000 VM configurations in ../env/dev/vm_instances.auto.tfvars.json
Generated 1000 import blocks in ../env/dev/vm_imports.tf
```

#### Output File 1: `env/dev/vm_instances.auto.tfvars.json`

A JSON map of every discovered instance. Terraform auto-loads any file ending in `.auto.tfvars.json`, so this file feeds directly into the `vm_instances` variable without any manual wiring. Example:

```json
{
  "vm_instances": {
    "prod-vm-1": {
      "ami": "ami-12345678",
      "instance_type": "t3.large",
      "subnet_id": "subnet-mock",
      "security_group_ids": ["sg-12345"],
      "key_name": "prod-key",
      "iam_instance_profile": "",
      "tags": { "Name": "prod-vm-1", "Environment": "Prod" },
      "platform": "linux",
      "root_volume": { "size": 20, "volume_type": "gp3", "encrypted": true },
      "ebs_volumes": {}
    }
  }
}
```

#### Output File 2: `env/dev/vm_imports.tf`

A Terraform file containing one `import {}` block per instance. These blocks tell Terraform: *"this real AWS instance already exists — adopt it into state instead of trying to create it."* This is a native Terraform 1.5+ feature. Example:

```hcl
# AUTO-GENERATED - DELETE AFTER SUCCESSFUL IMPORT

import {
  to = module.infrastructure.module.vm["prod-vm-1"].aws_instance.this
  id = "i-0abcd1234efgh5678"
}

import {
  to = module.infrastructure.module.vm["prod-vm-2"].aws_instance.this
  id = "i-0efgh5678ijkl9012"
}
```

**At this point you have:** Two generated files sitting in `env/dev/`. The JSON file defines *what each instance looks like*. The import file tells Terraform *which real AWS resource maps to which Terraform resource address*. Terraform hasn't touched anything yet.

---

### Step 3 — Terraform Plan (Dry-Run Reconciliation)

Now let Terraform read both files and build an execution plan.

The `env/dev/` directory contains a file called `localstack_override.tf` that redirects all Terraform AWS API calls to `http://localhost:4566` with dummy credentials. This is what makes Terraform talk to LocalStack instead of real AWS — no config changes needed on your part.

```bash
cd env/dev
terraform init
terraform plan
```

**What `terraform plan` does:**
1. Reads `vm_instances.auto.tfvars.json` → populates the `vm_instances` variable map.
2. The `infrastructure` module iterates the map with `for_each` → creates a `module.vm["key"]` for every entry.
3. Reads `vm_imports.tf` → sees 1,000 `import {}` blocks.
4. For each import block, Terraform calls the AWS API (LocalStack) to fetch the live state of that instance ID.
5. Compares the live state against the module definition. If they match → zero drift.

**Expected output:**
```
Plan: 1000 to import, 0 to add, 0 to change, 0 to destroy.
```

The critical numbers are **0 to add, 0 to change, 0 to destroy**. This means Terraform will adopt all 1,000 instances into state without modifying any of them.

> If you see additions or changes, it means the Terraform module definition doesn't exactly match the live instance state. The `modules/vm/main.tf` has `lifecycle { ignore_changes = [ami, user_data, user_data_base64] }` to handle common mismatches. For other drift, adjust the module defaults or add more fields to `ignore_changes`.

---

### Step 4 — Terraform Apply (Adopt Into State)

```bash
terraform apply
```

This is where the actual import happens. Terraform writes each instance's full state into the Terraform state file (`.tfstate`). **No infrastructure is created, modified, or destroyed.** The only thing that changes is Terraform's internal record of what it manages.

**Expected output:**
```
Apply complete! Resources: 1000 imported, 0 added, 0 changed, 0 destroyed.
```

**At this point:** All 1,000 instances exist in the Terraform state. Terraform now "owns" them.

---

### Step 5 — Post-Import Cleanup

The import blocks are a one-time mechanism. After a successful apply, delete them:

```bash
rm env/dev/vm_imports.tf
```

Verify the state is clean and Terraform sees no pending changes:

```bash
terraform plan
```

**Expected output:**
```
No changes. Your infrastructure matches the configuration.
```

This confirms that the `.auto.tfvars.json` configuration file and the Terraform module definition perfectly describe the live infrastructure. From this point forward, any changes to these instances must go through the Terraform workflow.

---

### Step 6 — Commit to Git

```bash
cd ../..
git add env/dev/vm_instances.auto.tfvars.json
git add modules/ infrastructure/ env/
git commit -m "Import 1000 ClickOps instances into Terraform management"
```

> **Do not commit** `vm_imports.tf` (it's been deleted) or `.tfstate` files (they should be stored remotely via an S3 backend).

---

### Step 7 — Tear Down the Mock Environment

When you're done testing, stop LocalStack and remove the generated files:

```bash
docker stop localstack
rm env/dev/vm_imports.tf env/dev/vm_instances.auto.tfvars.json 2>/dev/null
```

---

## The Final Result

After a real production run, here's what your repo and state look like:

**In Git (version-controlled):**
```
env/dev/vm_instances.auto.tfvars.json   ← Configuration for every imported instance
modules/vm/main.tf                      ← Reusable EC2 module that describes the resource
infrastructure/main.tf                  ← Wiring: for_each over the instance map
```

**In Terraform State (remote, not in Git):**
```
module.infrastructure.module.vm["prod-vm-1"].aws_instance.this
module.infrastructure.module.vm["prod-vm-2"].aws_instance.this
module.infrastructure.module.vm["prod-vm-3"].aws_instance.this
...
module.infrastructure.module.vm["prod-vm-1000"].aws_instance.this
```

**In the AWS Console:** Exactly the same instances as before. Nothing was created, destroyed, or restarted. The only difference is that Terraform now tracks them.

**What changes going forward:**
- Want to change an instance type? Edit `vm_instances.auto.tfvars.json`, run `terraform plan`, review the diff, `terraform apply`.
- Want to decommission an instance? Remove its entry from the JSON, `terraform apply` → Terraform terminates it.
- Want to audit configuration? `git log env/dev/vm_instances.auto.tfvars.json`.
- Want to replicate the environment? The module + JSON are portable to any AWS account.

---

## Performance

The discovery script (`scripts/generate_vm_imports.py`) is designed for enterprise scale:

| Metric | Complexity | Why |
|--------|-----------|-----|
| CPU | O(N) | Single pass over N instances |
| Network | O(1) API round-trips | Bulk-fetches all Volume metadata in one paginated call, then uses an in-memory hash map for O(1) lookups per instance |
| Wall time | ~5 seconds for 1,000 instances | Bottleneck is the API call, not the script |

It solves the **N+1 Query Problem**: a naïve implementation would make one `describe-volumes` call per instance (1,000 API calls). This script makes one bulk call and caches the result.

---

## File Structure

```
clik-reconciler/
├── modules/
│   ├── vm/                             # Reusable EC2 module (instance + volumes)
│   │   ├── main.tf                     #   Resource definitions with lifecycle rules
│   │   ├── variables.tf                #   Input variable schema
│   │   └── outputs.tf                  #   Instance ID and private IP outputs
│   ├── storage/                        # S3 bucket module
│   └── iam/                            # IAM roles and instance profiles
├── infrastructure/
│   ├── main.tf                         # Module wiring: for_each over vm_instances
│   └── variables.tf                    # Type-strict variable definitions
├── env/
│   ├── dev/
│   │   ├── dev.tf                      # Calls the infrastructure module
│   │   ├── locals.tf                   # Project name, region, bucket configs
│   │   ├── providers.tf                # AWS provider configuration
│   │   ├── variables.tf                # Variable declarations for this environment
│   │   ├── localstack_override.tf      # Redirects Terraform to LocalStack (mock testing)
│   │   ├── vm_instances.auto.tfvars.json  # (generated) — do not commit until production import
│   │   └── vm_imports.tf               # (generated, one-time) — delete after terraform apply
│   ├── staging/                        # Staging environment configs
│   └── prod/                           # Production environment configs
└── scripts/
    ├── generate_vm_imports.py          # The reconciler: discovers instances → generates .tf + .json
    ├── setup_remote_state.sh           # Creates S3 bucket + DynamoDB table for Terraform state backend
    ├── destroy_remote_state.sh         # Removes the remote state backend resources
    ├── cleanup_aws_env.sh              # Tears down AWS resources created during testing
    ├── cleanup_local_state.sh          # Deletes local .terraform/ directory and lock files
    └── sync_kb.sh                      # Syncs knowledge base content
```
