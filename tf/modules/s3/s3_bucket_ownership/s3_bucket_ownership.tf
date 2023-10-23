resource "aws_s3_bucket_ownership_controls" "s3_ownership_control" {
  bucket = var.s3_bucket_id
  rule {
    object_ownership = var.bucket_object_ownership
  }
}