variable "allocation_id" {
  type = string
  description = "The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public."
}
variable "pub_subnet_id" {
  type        = string
  description = "Public Subnet ID to attach the nat gateway"
}
variable "nat_gtw_name" {
  type = string
  default = "demo_nat_gtw"
}
variable "project_name" {
  type = string
  default = "demo"
}
variable "connectivity_type" {
  type = string
  description = "Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public."
}
