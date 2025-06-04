terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
        random = {
        source  = "hashicorp/random"
        version = "~> 3.0"
        }
    }
    
    required_version = ">= 1.4.0"
}
provider "aws" {
    region  = var.aws_region
}

data "aws_caller_identity" "current" {}

# data "aws_s3_bucket" "terraform_state" {
#     bucket = var.terraform_state_bucket
# }

