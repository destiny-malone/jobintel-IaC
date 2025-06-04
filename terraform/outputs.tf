# Terraform Remote State Outputs
output "s3_bucket_name" {
  description = "Terraform state storage bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  description = "State locking table for Terraform"
  value       = aws_dynamodb_table.terraform_state_lock.name
}

# Security & IAM Output1

# Security & IAM Output2


# CI/CD Pipeline Output

# # Slack Notifications Webhook

# # Artifact Storage Location

# Debugging & Audit Trail Outputs

# # Terraform Version Output

# # AWS Account and Region Outputs
output "aws_account_id" {
  description = "AWS Account where resources are deployed"
  value       = data.aws_caller_identity.current.account_id
}

output "current_region" {
  description = "Region where Terraform resources are deployed"
  value       = var.aws_region
}