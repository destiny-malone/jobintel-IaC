resource "aws_s3_bucket" "terraform_state" {
  bucket = "jobintel-terraform-state"
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name = "jobintel-terraform-state"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "jobintel-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "jobintel-terraform-state-lock"
  }
}
terraform {
    backend "s3" {
        bucket         = aws_s3_bucket.terraform_state.bucket
        key            = "terraform.tfstate"
        region         = "us-west-2"
        dynamodb_table = aws_dynamodb_table.terraform_state_lock.name
        encrypt        = true
    }
}