variable "bucket_name" {
  type        = string
  default = "demo_bucket"
  description = "The unique bucket name"
}

variable "force_destroy" {
  type    = bool
  /* default = false */
}
variable "project_name" {
  type = string
  default = "demo"
}