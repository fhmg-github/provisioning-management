module "demo_vpc" {
  source               = "../../modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}
