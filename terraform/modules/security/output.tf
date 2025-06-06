output "security_policy_arn" {
  description = "ARN of the security policy applied to Terraform execution"
  value       = aws_iam_policy.terraform_security_policy.arn
}

output "security_scan_enabled" {
  description = "Boolean flag indicating if security scans are active"
  value       = var.enable_security_scan
}
output "existing_security_policy_arn" {
  value = data.aws_iam_policy.existing_security_policy.arn
}