variable "security_policy_name" {
  description = "IAM security policy name"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM role for security enforcement"
  type        = string
}

variable "enable_security_scan" {
  description = "Enable security scan for Terraform configs"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}