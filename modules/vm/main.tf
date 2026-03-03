resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile != "" ? var.iam_instance_profile : null

  # Critical for importing existing instances without replacing them
  lifecycle {
    ignore_changes = [
      ami, # AMIs get updated; don't rebuild the server if the AMI changes
      user_data,
      user_data_base64
    ]
  }

  root_block_device {
    volume_size = var.root_volume.size
    volume_type = var.root_volume.volume_type
    encrypted   = var.root_volume.encrypted
  }

  tags = merge(
    {
      "Name"        = var.instance_name
      "Project"     = var.project_name
      "Environment" = var.environment
      "Platform"    = var.platform
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

# Optional extra volumes
resource "aws_ebs_volume" "extra" {
  for_each = var.ebs_volumes

  availability_zone = aws_instance.this.availability_zone
  size              = each.value.size
  type              = each.value.volume_type
  encrypted         = each.value.encrypted

  tags = merge(
    {
      "Name"        = "${var.instance_name}-${each.key}"
      "Project"     = var.project_name
      "Environment" = var.environment
    },
    var.tags
  )
}

resource "aws_volume_attachment" "extra" {
  for_each = var.ebs_volumes

  device_name = each.value.device_name
  volume_id   = aws_ebs_volume.extra[each.key].id
  instance_id = aws_instance.this.id
}
