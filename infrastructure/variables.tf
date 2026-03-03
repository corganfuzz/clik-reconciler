variable "project_name" { type = string }
variable "environment" { type = string }
variable "aws_region" { type = string }

variable "s3_buckets" {
  description = "Map of S3 bucket configurations"
  type = map(object({
    versioning = bool
  }))
}

variable "iam_roles" {
  description = "Map of IAM role configurations"
  type = map(object({
    trust_service = string
  }))
}

variable "vm_instances" {
  description = "Map of VM configurations for imported ClickOps instances"
  type = map(object({
    ami                  = string
    instance_type        = string
    subnet_id            = string
    security_group_ids   = list(string)
    key_name             = string
    iam_instance_profile = string
    tags                 = map(string)
    platform             = string
    root_volume = object({
      size        = number
      volume_type = string
      encrypted   = bool
    })
    ebs_volumes = optional(map(object({
      size        = number
      volume_type = string
      encrypted   = bool
      device_name = string
    })), {})
  }))
  default = {}
}
