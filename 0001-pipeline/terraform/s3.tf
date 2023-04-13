/* terraform {
  backend "s3" {
    bucket = "0001-project-tf-bucket"
    key    = "terraform/tfstate"
    region = "us-west-1"
  }
} */

resource "aws_s3_bucket" "terraform" {
  bucket = "0001-project-tf-bucket"
  force_destroy = true
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
    prevent_destroy = false
}
}
