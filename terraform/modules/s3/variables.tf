variable "bucket_name" {
  type        = string
  description = "The unique bucket name"
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "prevent_destroy" {
  type    = bool
  default = true
}

variable "bucket_object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"
}

variable "bucket_exposure" {
  type    = string
  default = "private"
}

variable "versioning_configuration_status" {
  type    = string
  default = "Enabled"
}

variable "s3_bucket_id" {
  type = string
}
