module "demo_vpc" {
  source               = "../../modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "demo_pub_subnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "public_subnet"
  vpc_id                  = module.demo_vpc.vpc_id
  cidr_block              = cidrsubnet(module.demo_vpc.vpc_cidr_block, 3, 0)
  az                      = var.subnet_az
  map_public_ip_on_launch = true
}

module "demo_priv_subnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "private_subnet"
  vpc_id                  = module.demo_vpc.vpc_id
  cidr_block              = cidrsubnet(module.demo_vpc.vpc_cidr_block, 3, 1)
  az                      = var.subnet_az
  map_public_ip_on_launch = false
}

module "demo_ig" {
  source = "../../modules/internet_gateway"
  vpc_id = module.demo_vpc.vpc_id
}

module "demo_eip" {
  source = "../../modules/eip"
  domain = "vpc"
}

module "demo_pub_nat_gateway" {
  source        = "../../modules/nat_gateway/public_nat_gateway"
  eip_id        = module.demo_eip.eip_id
  pub_subnet_id = module.demo_pub_subnet.subnet_id
  depends_on    = [module.demo_eip]
}

module "demo_pub_route_tables" {
  source              = "../../modules/route_tables/public_route_table"
  route_table_name    = "demo_pub_route_tables"
  vpc_id              = module.demo_vpc.vpc_id
  internet_gateway_id = module.demo_ig.internet_gateway_id
  cidr_block          = var.pub_route_tables_cidr_block
}

module "demo_priv_route_tables" {
  source           = "../../modules/route_tables/private_route_table"
  route_table_name = "demo_priv_route_tables"
  vpc_id           = module.demo_vpc.vpc_id
  nat_gateway_id   = module.demo_pub_nat_gateway.pub_nat_gtw_id
  cidr_block       = var.priv_route_tables_cidr_block
}

module "demo_pub_route_tables_association" {
  source         = "../../modules/route_tables/route_table_association"
  subnet_id      = module.demo_pub_subnet.subnet_id
  route_table_id = module.demo_pub_route_tables.public_route_tables_id
}

module "demo_priv_route_tables_association" {
  source         = "../../modules/route_tables/route_table_association"
  subnet_id      = module.demo_priv_subnet.subnet_id
  route_table_id = module.demo_priv_route_tables.private_route_tables_id
}