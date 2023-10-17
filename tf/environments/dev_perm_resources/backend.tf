terraform {
  backend "s3" {
    bucket  = "this-demo-project"
    key     = "terraform/dev/perm_resources/perm-resources-dev.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
