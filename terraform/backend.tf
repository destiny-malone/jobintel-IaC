
terraform {
    backend "s3" {
        bucket         = "jobintel-terraform-state"
        key            = "terraform.tfstate"
        region         = "us-west-2"
        encrypt        = true
        # use_lockfile   = true
    }
}