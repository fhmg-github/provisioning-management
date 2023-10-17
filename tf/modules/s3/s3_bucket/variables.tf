variable "bucket_name" {
  type        = string
  description = "The unique bucket name"
}

variable "force_destroy" {
  type    = bool
  /* default = false */
}