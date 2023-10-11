variable "aws_region" {
  type    = string
  default = "us-west-2"
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
