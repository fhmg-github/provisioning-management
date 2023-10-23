variable "eip_id" {
  type = string
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