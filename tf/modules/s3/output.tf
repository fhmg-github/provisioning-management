output "s3_bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.s3_bucket.region
}

output "s3_ownership_control" {
  value = aws_s3_bucket_ownership_controls.s3_ownership_control
}