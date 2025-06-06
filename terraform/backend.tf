
terraform {
    backend "s3" {
        bucket         = "jobintel-terraform-state"
        key            = "terraform.tfstate"
        region         = "us-west-2"
        encrypt        = true
        dynamodb_table = "jobintel-terraform-state-lock"
        # use_lockfile   = true
    }
}