output "iam_role_arn" {
  description = "IAM role ARN for Terraform execution"
  value       = aws_iam_role.terraform_execution_role.arn
}

output "iam_policy_arn" {
  description = "IAM policy ARN for Terraform execution"
  value       = aws_iam_policy.terraform_execution_policy.arn
}