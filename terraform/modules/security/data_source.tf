data "aws_iam_policy" "existing_security_policy" {
  name = var.security_policy_name
}