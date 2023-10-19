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

variable "ubuntu_ami_id" {
  type        = string
  default     = "ami-03f65b8614a860c29"
  description = "Ubuntu AMI ID for us-west-2 region"
}

variable "windows_ami_id" {
  type        = string
  default     = "ami-0fae5ac34f36d5963"
  description = "Windows AMI ID for us-west-2 region"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "elk_instance_type" {
  type    = string
  default = "t2.large"
}

variable "bastion_access_key" {
  type    = string
  default = "bastion"
}

variable "private_instances_access_key" {
  type    = string
  default = "private_instances"
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