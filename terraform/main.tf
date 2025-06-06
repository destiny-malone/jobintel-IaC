# Manually created terraform-state and state-lock in AWS Management Console for s3 bucket and dynamodb table with correct region so that github can access
#  Removed s3 bucket policy
#  Removed s3 bucket versioning
#  Removed s3 bucket public access block
#  Removed s3 bucket ownership controls
#  Removed s3 bucket server side encryption configuration
#  Removed dynamodb table


resource "null_resource" "terraform_version_check" {
  provisioner "local-exec" {
    command = "terraform --version > terraform-version.txt"
  }
  triggers = {
    always_run = "${timestamp()}"
    terraform_version = "${terraform_version()}"
  }
}