terraform {
  backend "s3" {
    bucket         = "jobintel-artifact-storage"
    key            = "artifact/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "jobintel-artifact-state-lock"
  }
}