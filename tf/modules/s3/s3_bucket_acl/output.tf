output "s3_bucket_acl_id" {
  value       = aws_s3_bucket_acl.s3_bucket_acl.id
  description = "S3 bucket acl ID"
}
