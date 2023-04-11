module "vpc-network" {
  source = "../../modules/vpc-network"

  cidr_block = "10.0.0.0/16"
  az         = "us-west-2"
}

