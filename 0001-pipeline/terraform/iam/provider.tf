provider "aws" {
  region = "us-west-1"
}

terraform {
  backend "s3" {
    bucket = "0001-project-tf-bucket"
    key    = "terraform/pipeline/iam.tfstate"
    region = "us-west-1"
  }
}
