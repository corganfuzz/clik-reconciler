module "storage" {
  source = "../modules/storage"

  project_name = var.project_name
  environment  = var.environment
  s3_buckets   = var.s3_buckets
}

module "iam" {
  source = "../modules/iam"

  project_name        = var.project_name
  environment         = var.environment
  storage_bucket_arns = module.storage.bucket_arns
  iam_roles           = var.iam_roles
}

module "vm" {
  for_each = var.vm_instances
  source   = "../modules/vm"

  project_name  = var.project_name
  environment   = var.environment
  instance_name = each.key

  ami                  = each.value.ami
  instance_type        = each.value.instance_type
  subnet_id            = each.value.subnet_id
  security_group_ids   = each.value.security_group_ids
  key_name             = each.value.key_name
  iam_instance_profile = each.value.iam_instance_profile
  tags                 = each.value.tags
  platform             = each.value.platform
  root_volume          = each.value.root_volume
  ebs_volumes          = each.value.ebs_volumes
}
