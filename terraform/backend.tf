terraform {
  backend "s3" {
    bucket  = "demo"
    key     = "terraform/demo.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
