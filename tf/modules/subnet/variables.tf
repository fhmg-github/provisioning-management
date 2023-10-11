variable "cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which to create the subnet"
}

variable "az" {
  type        = string
  description = "The availability zone for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to map a public IP on instance launch"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}
