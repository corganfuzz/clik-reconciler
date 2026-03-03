data "aws_caller_identity" "current" {}

# Generic Role Creation
resource "aws_iam_role" "this" {
  for_each = var.iam_roles
  name     = "${var.project_name}-${var.environment}-${each.key}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = each.value.trust_service == "self" ? {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
          } : length(regexall("\\.amazonaws\\.com$", each.value.trust_service)) > 0 ? {
          Service = each.value.trust_service
          } : {
          AWS = each.value.trust_service
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "this" {
  for_each = var.iam_roles
  name     = "${var.project_name}-${var.environment}-${each.key}-profile"
  role     = aws_iam_role.this[each.key].name
}
