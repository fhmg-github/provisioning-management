variable "create_resource" {
  type        = bool
  default     = true
  description = "Set to true to create resource(s), false to ignore it (cmd terraform plan) or destroy it (cmd terraform destroy)."
}

variable "ami_id" {
  type        = string
  default     = "ami-00756a2b7a21e2bd3"
  description = "us-west-1 ami-id ubuntu"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "access_key" {
  type        = string
  default     = "fhmglearningaws2-us-west-1"
  description = "us-west-1 key"
}

variable "assoc_pub_ip" {
  type        = bool
  default     = false
  description = "Set to true locally to associate public ip"
}

variable "security_group_id" {
  type    = list(any)
  default = []
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = object({
  })
}
