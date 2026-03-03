variable "project_name" { type = string }
variable "environment" { type = string }
variable "instance_name" { type = string }

variable "ami" { type = string }
variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "security_group_ids" { type = list(string) }
variable "key_name" { type = string }
variable "iam_instance_profile" { type = string }
variable "tags" { type = map(string) }
variable "platform" { type = string }

variable "root_volume" {
  type = object({
    size        = number
    volume_type = string
    encrypted   = bool
  })
}

variable "ebs_volumes" {
  description = "Additional EBS volumes"
  type = map(object({
    size        = number
    volume_type = string
    encrypted   = bool
    device_name = string
  }))
  default = {}
}
