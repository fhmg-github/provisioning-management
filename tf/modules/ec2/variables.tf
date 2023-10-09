variable "perm_resource" {
  type        = bool
  default     = true
  description = "Set to true to create permanent resource(s), false to ignore it (cmd terraform plan) or destroy it (cmd terraform destroy)."
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
  type    = list(any)
  default = []
}

variable "subnet_id" {
  type = string
}

variable "private_ip" {
  type = string
}
