data "aws_s3_bucket" "artifact_storage_bucket" {
    bucket = var.artifact_storage_bucket
}
data "aws_s3_bucket_public_access_block" "artifact_storage_public_access_block" {
    bucket = var.artifact_storage_bucket
}
data "aws_s3_bucket_versioning" "artifact_storage_versioning" {
    bucket = var.artifact_storage_bucket
}
data "aws_s3_bucket_ownership_controls" "artifact_storage_ownership_controls" {
    bucket = var.artifact_storage_bucket
}
data "aws_s3_bucket_server_side_encryption_configuration" "artifact_encryption_algorithm" {
    bucket = var.artifact_storage_bucket
}

data "aws_iam_role" "artifact_role" {
    name = var.iam_role_arn
}