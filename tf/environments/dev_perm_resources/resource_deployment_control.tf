variable "bucket_state_perm_resource" {
  type        = bool
  default     = true
  description = "Controls if the S3 bucket that contains the terraform state file should be deployed or destroyed True = Deploy, False = Destroy"
}

variable "perm_resource" {
  type        = bool
  default     = true
  description = "This controls if the permanent resource will be deployed or destroyed"
}

variable "temp_resource" {
  type        = bool
  default     = true
  description = "This controls if the temporary resource will be deployed or destroyed"
}