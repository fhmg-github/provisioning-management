
variable "s3_bucket_id" {
  type = string
}

variable "bucket_exposure" {
  type = string
}

variable "s3_ownership_control" {
  type = set(any)
}