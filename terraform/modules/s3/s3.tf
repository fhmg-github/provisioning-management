resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_control" {
  bucket = var.s3_bucket_id
  rule {
    object_ownership = var.bucket_object_ownership
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership_control]
  bucket     = var.s3_bucket_id
  acl        = var.bucket_exposure
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = var.s3_bucket_id
  versioning_configuration {
    status = var.versioning_configuration_status
  }
  lifecycle {
    prevent_destroy = true
  }
}
