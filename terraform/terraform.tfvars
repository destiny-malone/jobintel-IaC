aws_region = "us-west-2"
aws_account_id = "057286249049"
terraform_state_bucket = "jobintel-terraform-state"
terraform_state_lock_table = "jobintel-terraform-state-lock"

environment = "dev"
terraform_workspace = "dev"

iam_role_name = "jobintel-terraform-role"
iam_policy_name = "jobintel-terraform-policy"

slack_webhook_url = "https://hooks.slack.com/services/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"
artifact_store_bucket = "jobintel-artifact-storage"


security_scan_enabled = true
security_scan_image = "jobintel/security-scan:latest"