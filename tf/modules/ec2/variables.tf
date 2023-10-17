variable "instance_name" {
  type = string
  default = "Define EC2 name"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "access_key" {
  type        = string
  description = "Define SSH key"
}

variable "assoc_pub_ip" {
  type        = bool
  description = "Set to true locally to associate public ip"
}

variable "security_group_id" {
  type = list(string)
  /* type    = list(any)
  default = [] */
}

variable "subnet_id" {
  type = string
}

variable "private_ip" {
  type = string
  nullable = true
}
