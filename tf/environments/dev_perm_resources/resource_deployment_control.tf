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
