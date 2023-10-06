variable "perm_resource" {
  type    = bool
  default = true
}

variable "temp_resource" {
  type    = bool
  default = true
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "az" {
  type    = string
  default = "us-west-2a"
}

variable "tags" {
  type = object({
  })
  default = {
    default_tags = {
      ManagedBy   = "Terraform"
      Environment = "Dev"
      Project     = "Demo"
    }
  }
}
