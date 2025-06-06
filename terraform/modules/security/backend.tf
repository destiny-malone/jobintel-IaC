terraform {
  backend "s3" {
    bucket         = "jobintel-security-state"
    key            = "security/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "jobintel-security-state-lock"
  }
}