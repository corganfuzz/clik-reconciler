locals {
  # ==============================================
  # Project Settings
  # ==============================================
  project_name = "clik-reconciler"
  environment  = "dev"
  aws_region   = "us-east-1"


  # ==============================================
  # Storage Configuration
  # ==============================================
  s3_buckets = {
    "vm-backups" = { versioning = true }
    "vm-logs"    = { versioning = false }
  }

  # ==============================================
  # IAM Roles and Permissions
  # ==============================================
  iam_roles = {
    "vm-basic" = { trust_service = "ec2.amazonaws.com" }
  }
}


