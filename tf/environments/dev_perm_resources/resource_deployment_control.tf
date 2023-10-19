/* variable "bucket_state_perm_resource" {
  type        = bool
  default     = true
  description = "Controls if the S3 bucket that contains the terraform state file should be deployed or destroyed True = Deploy, False = Destroy"
} */

variable "ec2_perm_resource" {
  type        = bool
  default     = true
  description = "This controls if the permanent resource will be deployed or destroyed"
}

variable "ec2_temp_resource" {
  type        = bool
  default     = true
  description = "This controls if the permanent resource will be deployed or destroyed"
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

/* variable "nat_gateway_resource" {
  type        = bool
  default     = false
  description = "This controls if the NAT gatway resource will be deployed or destroyed"
} */