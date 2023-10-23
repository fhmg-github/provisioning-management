resource "aws_route_table" "public_route_tables" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr_block
    gateway_id = var.internet_gateway_id
  }
    tags = {
    "Name" = var.route_table_name
    "Project" = var.project_name
  }
}
