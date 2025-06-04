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

# Terraform State Variables
variable "terraform_state_bucket" {
  description = "S3 bucket for Terraform state storage"
  type        = string
  default     = "jobintel-terraform-state"
}
variable "terraform_state_key" {
  description = "S3 key for Terraform state file"
  type        = string
  default     = "terraform.tfstate"
}
variable "terraform_state_lock_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
  default     = "jobintel-terraform-state-lock"
}
variable "terraform_state_versioning" {
  description = "Enable versioning for Terraform state bucket"
  type        = bool
  default     = true
}
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
variable "slack_webhook_url" {
  description = "Slack webhook URL for notifications"
  type        = string
}

variable "artifact_store_bucket" {
  description = "S3 bucket for storing CI/CD artifacts"
  type        = string
}

variable "terraform_workspace" {
  description = "Terraform workspace/environment"
  type        = string
}
variable "artifact_storage_location" {
  description = "S3 bucket for storing build artifacts"
  type        = string
  default     = "jobintel-artifacts"
}

variable "security_scan_image" {
  description = "Container image for security scanning"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role used for Terraform execution"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM policy used for Terraform execution"
  type        = string
}
variable "security_scan_enabled" {
  description = "Enable security scanning in CI/CD pipeline"
  type        = bool
  default     = true
}
