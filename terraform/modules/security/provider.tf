terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
  }
  
  required_version = ">= 1.4.0"
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

data "aws_iam_policy" "security_policy_name" {
    name = var.security_policy_name
}