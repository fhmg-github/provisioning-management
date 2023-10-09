variable "ami_id" {
  type    = string
  default = "ami-00756a2b7a21e2bd3" # us-west-1 ami-id
}

variable "ansible_master_ami_id" {
  type    = string
  default = "ami-0785c7e4a9157c199"
}

variable "jenkinsmaster_ami_id" {
  type    = string
  default = "ami-0542cc84792319d68"
}

variable "windows_ami_id" {
  type    = string
  default = "ami-0c6269b2ddb61bb2e"
}

variable "free_tier" {
  type    = string
  default = "t2.micro"
}

variable "bastion_access_key" {
  type    = string
  default = "fhmglearningaws2-us-west-1" # us-west-1 key
}

variable "private_instances_access_key" {
  type    = string
  default = "aws_pipeline_private_instances" # us-west-1 key
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

variable "aws_private_key_local_path" {
  type    = string
  default = "/Users/fernandogoncalves/.ssh/fhmglearningaws2-us-west-1.pem"
}

variable "create_perm_resource" {
  description = "Set to true to create permanent resource(s), false to ignore it (cmd terraform plan) or destroy it (cmd terraform destroy)."
  type        = bool
  default     = true
}

variable "create_temp_resource" {
  description = "Set to true to create temporary resource(s), false to ignore it (cmd terraform plan) or destroy it (cmd terraform destroy)."
  type        = bool
  default     = true
}