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