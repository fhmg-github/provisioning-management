variable "s3_bucket_id" {
  type = string
}

variable "versioning_configuration_status" {
  type = string
}

variable "prevent_destroy" {
  type    = bool
  default = true
}
