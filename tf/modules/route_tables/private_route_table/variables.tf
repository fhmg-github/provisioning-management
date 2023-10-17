variable "vpc_id" {
  type = string
}

variable "nat_gateway_id" {
  /* type = string */
  nullable = true
}

variable "cidr_block" {
  type = string
}

variable "route_table_name" {
  type = string
}
