resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  /* depends_on = [var.s3_ownership_control] */
  bucket = var.s3_bucket_id
  acl    = var.bucket_exposure
}
