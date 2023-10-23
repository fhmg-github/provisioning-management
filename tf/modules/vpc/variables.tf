variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "enable_dns_support" {
  type    = bool
  default = false
}

variable "vpc_name" {
  type        = string
  default = "demo_vpc"
}
variable "project_name" {
  type = string
  default = "demo"
}