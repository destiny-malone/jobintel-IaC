resource "aws_s3_bucket" "artifact_storage_bucket" {
  bucket = var.artifact_storage_bucket
  force_destroy = true
  tags = {
    Name = var.artifact_storage_bucket
    Environment = var.environment
  }
}
resource "aws_s3_bucket_versioning" "artifact_storage_versioning" {
  bucket = aws_s3_bucket.artifact_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "artifact_storage_lifecycle" {
  bucket = aws_s3_bucket.artifact_storage.id

  rule {
    id      = "expire-old-artifacts"
    status  = "Enabled"

    expiration {
      days = var.artifact_retention_days
    }

    filter {
      prefix = "artifacts/"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "artifact_storage_public_access_block" {
  bucket = aws_s3_bucket.artifact_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_ownership_controls" "artifact_storage_ownership_controls" {
  bucket = aws_s3_bucket.artifact_storage.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "artifact_storage_encryption" {
  bucket = aws_s3_bucket.artifact_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "artifact_storage_policy" {
  bucket = aws_s3_bucket.artifact_storage.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = { AWS = var.iam_role_arn }
        Action = ["s3:PutObject", "s3:GetObject", "dynamodb:UpdateItem"]
        Resource = "${aws_s3_bucket.artifact_storage.arn}/*"
      }
    ]
  })
}

