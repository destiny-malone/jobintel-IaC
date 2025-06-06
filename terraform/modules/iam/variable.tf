variable "iam_role_name" {
  description = "IAM role used for Terraform execution"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM policy used for Terraform execution"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}