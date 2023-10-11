variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "subnet_az" {
  type    = string
  default = "us-west-2a"
}

variable "s3_backend_bucket_name" {
  type    = string
  default = "demo"
}

variable "perm_resource" {
  type    = bool
  default = false
}

variable "temp_resource" {
  type    = bool
  default = true
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pub_route_tables_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "priv_route_tables_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
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
