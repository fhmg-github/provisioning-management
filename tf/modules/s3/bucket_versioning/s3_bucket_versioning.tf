resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = var.s3_bucket_id
  versioning_configuration {
    status = var.versioning_configuration_status
  }
  lifecycle {
    prevent_destroy = true
  }
}
