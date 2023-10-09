resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = var.nat_gateway_id
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = var.private_route_table_id
}
