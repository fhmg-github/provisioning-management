variable "ami_id" {
  type    = string
  default = "ami-00756a2b7a21e2bd3" # us-west-1 ami-id
}
variable "free_tier" {
  type    = string
  default = "t2.micro"
}

variable "access_key" {
  type    = string
  default = "fhmglearningaws2-us-west-1" # us-west-1 key
}

variable "az" {
  type    = string
  default = "us-west-1a"
}

variable "vpc-0-cidr-block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env_tags" {
  type = map(object({
    ManagedBy   = string
    Environment = string
    Project     = string
  }))
  default = {
    default_tags = {
      ManagedBy   = "Terraform"
      Environment = "DEV"
      Project     = "0001-pipeline"
    }
  }
}
