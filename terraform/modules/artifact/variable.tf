variable "artifact_storage_bucket" {
  description = "S3 bucket for storing CI/CD artifacts"
  type        = string
}

variable "artifact_retention_days" {
  description = "Number of days to retain artifacts in S3"
  type        = number
  default     = 30

  validation {
    condition     = var.artifact_retention_days >= 7
    error_message = "Artifact retention days must be at least 7 days."
  }
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "iam_role_arn" {
  description = "IAM role with permissions to access artifact storage"
  type        = string
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}