resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = var.s3_bucket_id
  acl    = var.bucket_exposure
}