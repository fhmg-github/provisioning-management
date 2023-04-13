resource "aws_s3_bucket" "terraform" {
  bucket        = "0001-project-tf-bucket"
  force_destroy = false
}

resource "aws_s3_bucket_acl" "terraform-acl" {
  bucket = aws_s3_bucket.terraform.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "terraform-versioning" {
  bucket = aws_s3_bucket.terraform.id
  versioning_configuration {
    status = "Enabled"
  }
  lifecycle {
    prevent_destroy = true
  }
}
