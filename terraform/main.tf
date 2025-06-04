resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket
  tags = {
    Name = "jobintel-terraform-state"
  }
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "terraform_state_policy" {
  bucket = aws_s3_bucket.terraform_state.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.terraform_state.arn}/*"
      },
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.terraform_state.arn}/*"
      }
    ]
  })
}
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_public_access_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = var.terraform_state_public_access_block
  block_public_policy     = var.terraform_state_public_access_block
  ignore_public_acls      = var.terraform_state_public_access_block
  restrict_public_buckets = var.terraform_state_public_access_block
}
resource "aws_s3_bucket_ownership_controls" "terraform_state_ownership_controls" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
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