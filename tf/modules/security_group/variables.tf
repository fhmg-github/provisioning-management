variable "sg_name" {
  type        = string
  default     = "demo_sg_name"
  description = "Give a name to the security group"
}

variable "vpc_id" {
  type = string
}

variable "project_name" {
  type    = string
  default = "demo"
}
