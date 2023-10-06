resource "aws_route_table" "route_table_private" {
  vpc_id = output.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = output.nat_gateway
  }
}

resource "aws_route_table_association" "route-table-association-private-subnet" {
  subnet_id      = output.private_subnet_id
  route_table_id = output.private_route_table_id
}
