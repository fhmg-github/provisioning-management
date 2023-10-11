variable "eip_id" {
  type = string
}

variable "pub_subnet_id" {
  type        = string
  description = "Public Subnet ID to attach the nat gateway"
}
