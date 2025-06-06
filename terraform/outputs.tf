# Terraform Remote State Outputs
output "terraform_state_bucket" {
  description = "Terraform state storage bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "state_lock_dynamodb" {
  description = "State locking table for Terraform"
  value       = aws_dynamodb_table.terraform_state_lock.name
}
# Debugging & Audit Trail Outputs

# # Terraform Version Output
output "terraform_version" {
  description = "Terraform version running in the pipeline"
  value       = data.external.terraform_version.result.version
}
# # AWS Account and Region Outputs
output "aws_account_id" {
  description = "AWS Account where resources are deployed"
  value       = var.aws_account_id
}

output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

output "current_env_config" {
  value = lookup(local.env_config, var.environment, "jobintel-default")
}