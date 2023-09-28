resource "aws_s3_bucket" "terraform" {
  bucket        = "0001-project-tf-bucket"
  force_destroy = false
  tags = {
    Name = "Terraform bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "terraform-s3-ownership" {
  bucket = aws_s3_bucket.terraform.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "terraform-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.terraform-s3-ownership]
  bucket     = aws_s3_bucket.terraform.id
  acl        = "private"
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
