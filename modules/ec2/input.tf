variable "key_name" {
  type    = string
  default = "fhmglearningaws2"
}

variable "ami_id" {
  default = "ami-0ecc74eca1d66d8a6" # us-west-2 AMI ID
  type    = string
}

variable "instance_type" {
  default = "t2.micro" # free tier
  type    = string
}

variable "associate_public_ip_address" {
  default = true
  type    = bool
}

variable "allow_ssh_access_from_outside" {
  default = true
  type    = bool
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type    = list(any)
  default = []
}

variable "tags" {
  type = object({})
}

