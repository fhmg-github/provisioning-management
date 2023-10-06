resource "aws_route_table" "route_table_public" {
  vpc_id = output.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = output.internet_gateway_id
  }

  tags = merge(
    var.tags
  )
}

# ROUTING TABLE ASSOCIATION

resource "aws_route_table_association" "route_table_association_public_subnet" {
  subnet_id      = output.public_subnet_id
  route_table_id = output.public_subnet_id
}
