variable "egress_sg_name" {
  type        = string
  default = "egress_sg_name"
  description = "Give a name to the security group"
}

variable "vpc_id" {
  type = string
}

variable "egress_port" {
  type        = number
  description = "i.e. 80, 22"
}

variable "egress_protocol" {
  type        = string
  description = "tcp/udp"
}

variable "egress_cidr_block" {
  type    = list(string)
  default = []
}
variable "project_name" {
  type = string
  default = "demo"
}
