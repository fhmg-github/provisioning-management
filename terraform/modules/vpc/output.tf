output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "elastic_ip_id" {
  value = aws_eip.elastic_ip.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.id
}

output "public_subnet_id" {
  value = aws_subnet.subnet_public.id
}

output "private_subnet_id" {
  value = aws_subnet.subnet_private.id
}

output "route_table_private_id" {
  value = aws_route_table.route_table_private.id
}

output "public_route_table_id" {
  value = aws_route_table.route_table_public.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
