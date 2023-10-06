resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_custom_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway.id
  }

  tags = merge(
    var.tags
  )
}

resource "aws_route_table" "route_table_private" {
  vpc_id = var.vpc_custom_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = merge(
    var.tags
  )
}

# ROUTING TABLE ASSOCIATION

resource "aws_route_table_association" "route_table_association_public_subnet" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "route-table-association-private-subnet" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.route_table_private.id
}
