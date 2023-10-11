variable "bucket_name" {
  type        = string
  description = "The unique bucket name"
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "s3_bucket_id" {
  type = string
}

variable "bucket_exposure" {
  type    = string
  default = "private"
}

variable "bucket_object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"
}

variable "versioning_configuration_status" {
  type        = string
  description = "enabled/disabled"
}