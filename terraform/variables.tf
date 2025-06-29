# AWS Configuration Variables
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}

variable "aws_account_id" {
  description = "AWS Account ID for resource deployment"
  type        = string
}

variable "artifact_storage_bucket" {
  description = "Artifact Storage bucket"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM Role ARN"
  type        = strirng
}

variable "iam_role_name" {
  description = "IAM Role name"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM Policy name"
  type        = string
}

# Terraform State Variables
variable "terraform_state_bucket" {
  description = "S3 bucket for Terraform state storage"
  type        = string
}
variable "terraform_state_key" {
  description = "S3 key for Terraform state file"
  type        = string
  default     = "terraform.tfstate"
}
variable "terraform_state_lock_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
# variable "terraform_state_versioning" {
#   description = "Enable versioning for Terraform state bucket"
#   type        = bool
#   default     = true
# }
variable "terraform_state_encryption" {
  description = "Enable encryption for Terraform state bucket"
  type        = bool
  default     = true
}
variable "terraform_state_public_access_block" {
  description = "Block public access to Terraform state bucket"
  type        = bool
  default     = true
}
variable "terraform_state_ownership_controls" {
  description = "Enforce bucket ownership for Terraform state bucket"
  type        = bool
  default     = true
}

# Environment Variables
variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "terraform_workspace" {
  description = "Terraform workspace/environment"
  type        = string
  default     = "dev"
}

variable "slack_webhook_url" {
  description = "SLACK_WEBHOOK_URL"
  type        = string
}