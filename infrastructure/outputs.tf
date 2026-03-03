output "s3_buckets" {
  value = module.storage.bucket_names
}

output "iam_roles" {
  value = module.iam.role_arns
}
