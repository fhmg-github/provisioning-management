variable "ingress_sg_name" {
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
  default = [ ]
}

/* variable "ingress_security_groups" {
  type = list(string)
  default = [ ]
} */

variable "ingress_security_groups" {
  type = string
}

variable "type" {
  type = string
}