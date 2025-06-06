output "artifact_bucket_name" {
  description = "Name of the artifact storage bucket"
  value       = aws_s3_bucket.artifact_storage.id
}

output "artifact_bucket_arn" {
  description = "ARN of the artifact storage bucket"
  value       = data.aws_s3_bucket.artifact_storage.arn
}

output "artifact_bucket_versioning" {
  description = "Versioning status for the artifact storage bucket"
  value       = aws_s3_bucket_versioning.artifact_storage_versioning.versioning_configuration[0].status
}

output "artifact_encryption_algorithm" {
  description = "Encryption algorithm used for the artifact storage bucket"
  value       = aws_s3_bucket_server_side_encryption_configuration.artifact_storage_encryption.rule[0].apply_server_side_encryption_by_default.sse_algorithm
}

output "artifact_bucket_public_access_block" {
  description = "Public access block settings for the artifact storage bucket"
  value       = aws_s3_bucket_public_access_block.artifact_storage_public_access_block
}