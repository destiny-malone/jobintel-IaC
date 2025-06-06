data "aws_ssm_parameter" "slack_webhook" {
  name = "/terraform/slack_webhook_url"
}

output "existing_slack_webhook_url" {
  value = data.aws_ssm_parameter.slack_webhook.value
}