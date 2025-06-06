terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.52.0"
        }
        random = {
        source  = "hashicorp/random"
        version = "~> 3.6.2"
        }
    }
    
    required_version = "~> 1.8.4"
}
provider "aws" {
    region  = var.aws_region
}

# Data sources for AWS resources - these are used to fetch information about existing buckets, roles, etc.
# This is useful for referencing existing resources without hardcoding values.
data "aws_caller_identity" "current" {}
data "aws_s3_bucket" "terraform_state_bucket" {
    bucket = var.terraform_state_bucket
}
data "aws_dynamodb_table" "terraform_state_lock_table" {
    name = var.terraform_state_lock_table
}
# data "external" "terraform_version" {
#     program = ["bash", "-c", "terraform version | head -n 1 | awk '{print $2}'"]
# }
data "aws_region" "current" {}


