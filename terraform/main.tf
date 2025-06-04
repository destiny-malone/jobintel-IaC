resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
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