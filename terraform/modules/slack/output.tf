output "slack_webhook_url" {
  description = "Slack webhook URL for Terraform notifications"
  value       = var.slack_webhook_url
}

output "slack_channel" {
  description = "Slack notification channel"
  value       = var.slack_channel
}