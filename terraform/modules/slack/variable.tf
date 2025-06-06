variable "slack_webhook_url" {
  description = "Slack webhook URL for notifications"
  type        = string
}

variable "slack_channel" {
  description = "Slack channel where notifications will be sent"
  type        = string
  default     = "#ci-cd-alerts"
}

variable "deployment_status" {
  description = "Deployment status message"
  type        = string
  default     = "Deployment Successful"
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}