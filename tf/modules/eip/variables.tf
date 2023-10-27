variable "domain" {
  type        = string
  description = "Indicates if this EIP is for use in VPC."
}

variable "eip_name" {
  type    = string
  default = "demo_eip"
}

variable "project_name" {
  type    = string
  default = "demo"
}