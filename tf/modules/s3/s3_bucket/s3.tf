resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags = {
    "Name" = var.bucket_name
    "Project" = var.project_name
  }
}
