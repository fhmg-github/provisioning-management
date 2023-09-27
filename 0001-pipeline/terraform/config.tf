
terraform {
  required_version = ">1.0"
  required_providers {
    aws = {
      version = "~> 4.47"
      source  = "hashicorp/aws"
    }
    ansible = {
      version = "~> 1.1.0"
      source  = "ansible/ansible"
    }
  }
}
