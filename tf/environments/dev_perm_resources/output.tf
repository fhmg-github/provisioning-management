output "s3_bucket_id" {
  value = module.demo_bucket.s3_bucket_id
}

output "s3_bucket_region" {
  value = module.demo_bucket.s3_bucket_region
}

output "vpc_id" {
  value = module.demo_vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.demo_vpc.vpc_cidr_block
}

output "pub_subnet_id" {
  value = module.demo_pub_subnet.subnet_id
}

output "priv_subnet_id" {
  value = module.demo_priv_subnet.subnet_id
}

output "ig_id" {
  value = module.demo_ig.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.demo_pub_nat_gateway.pub_nat_gtw_id
}

output "eip_id" {
  value = module.demo_eip.eip_id
}