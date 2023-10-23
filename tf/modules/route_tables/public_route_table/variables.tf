variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "route_table_name" {
  type = string
  default = "demo_pub_route_table"
}
variable "project_name" {
  type = string
  default = "demo"
}
