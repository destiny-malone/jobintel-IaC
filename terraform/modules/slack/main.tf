resource "null_resource" "slack_notification" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -X POST -H 'Content-type: application/json' --data '{
        "text": "Terraform Deployment Status: ${var.deployment_status}",
        "channel": "${var.slack_channel}",
        "username": "TerraformBot",
        "icon_emoji": ":rocket:"
      }' ${var.slack_webhook_url}
    EOT
  }

  depends_on = [
    aws_s3_bucket.terraform_state,
    aws_dynamodb_table.terraform_state_lock
  ]
}