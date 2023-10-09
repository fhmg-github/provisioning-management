variable "s3_bucket_id" {
  type = string
}

variable "bucket_object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"
}
