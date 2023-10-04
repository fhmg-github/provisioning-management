resource "aws_s3_bucket" "ansible" {
  bucket        = "0001-project-ansible-bucket"
  force_destroy = false
  tags = {
    Name = "Ansible-S3bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "ansible-s3-ownership" {
  bucket = aws_s3_bucket.ansible.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "ansible-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ansible-s3-ownership]
  bucket     = aws_s3_bucket.ansible.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "ansible-versioning" {
  bucket = aws_s3_bucket.ansible.id
  versioning_configuration {
    status = "Enabled"
  }
  lifecycle {
    prevent_destroy = true
  }
}