variable "security_group_name" {
  type        = string
  description = "Give a name to the security group"
}

variable "vpc_id" {
  type = string
}

variable "ingress_port" {
  type        = number
  description = "i.e. 80, 22"
}

variable "ingress_protocol" {
  type        = string
  description = "tcp/udp"
}

variable "ingress_cidr_block" {
  type    = list(string)
  default = []
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
