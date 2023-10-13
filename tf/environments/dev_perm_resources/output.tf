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

output "demo_pub_sg_id" {
  value = aws_security_group.demo_pub_sg.id
}

output "demo_maven_sg_id" {
  value = aws_security_group.demo_maven_sg.id
}
output "demo_jenkins_sg_id" {
  value = aws_security_group.demo_jenkins_sg.id
}

output "demo_jmeter_sg_id" {
  value = aws_security_group.demo_jmeter_sg.id
}

output "demo_elastic_sg_id" {
  value = aws_security_group.demo_elastic_sg.id
}

output "demo_kibana_sg_id" {
  value = aws_security_group.demo_kibana_sg.id
}

output "demo_logstash_sg_id" {
  value = aws_security_group.demo_logstash_sg.id
}

output "demo_jfrog_sg_id" {
  value = aws_security_group.demo_jfrog_sg.id
}

output "demo_windows_sg_id" {
  value = aws_security_group.demo_windows_sg.id
}