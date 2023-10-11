terraform {
  backend "s3" {
    bucket  = "this-project-demo"
    key     = "terraform/dev/perm_resources/perm-resources-dev.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
