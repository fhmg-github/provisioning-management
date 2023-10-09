output "s3_bucket_versioning_id" {
  value       = aws_s3_bucket_versioning.s3_bucket_versioning.id
  description = "ID of the s3 bucket versioning config"
}
