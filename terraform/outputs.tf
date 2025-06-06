# Manually created terraform-state and state-lock in AWS Management Console for s3 bucket and dynamodb table with correct region so that github can access

# Terraform Remote State Outputs
output "terraform_state_bucket" {
  description = "Terraform state storage bucket"
  value       = var.terraform_state_bucket
}

output "terraform_state_lock_table" {
  description = "State locking table for Terraform"
  value       = var.terraform_state_lock_table
}
# Debugging & Audit Trail Outputs

# # Terraform Version Output
# output "terraform_version" {
#   description = "Terraform version running in the pipeline"
#   value       = data.external.terraform_version.result.version
# }
# # AWS Account and Region Outputs
output "aws_account_id" {
  description = "AWS Account where resources are deployed"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

output "current_env_config" {
  value = lookup(local.env_config, var.environment, "jobintel-default")
}

output "artifact_storage_bucket" {
  description = "Artifact Storage Bucket"
  value       = var.artifact_storage_bucket
}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = var.iam_role_arn
}

output "iam_role_name" {
  description = "IAM Role Name"
  value       = var.iam_role_name
}

output "iam_policy_name" {
  description = "IAM Policy Name"
  value       = var.iam_policy_name
}

output "slack_webhook_url" {
  description = "Slack Webhook URL"
  value       = var.slack_webhook_url
}