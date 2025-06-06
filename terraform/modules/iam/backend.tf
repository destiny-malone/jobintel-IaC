terraform {
  backend "s3" {
    bucket         = "jobintel-iam-state"
    key            = "iam/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "jobintel-iam-state-lock"
  }
}