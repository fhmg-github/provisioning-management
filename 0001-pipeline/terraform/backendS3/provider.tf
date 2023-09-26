provider "aws" {
  region = "us-west-1"
}

terraform {
  backend "s3" {
    bucket = "0001-project-tf-bucket"
    key    = "terraform/backends3/tfstate"
    region = "us-west-1"
  }
}
