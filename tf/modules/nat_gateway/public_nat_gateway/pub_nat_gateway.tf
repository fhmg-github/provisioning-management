resource "aws_nat_gateway" "public_nat_gtw" {
  allocation_id = var.eip_id
  subnet_id     = var.pub_subnet_id
    tags = {
    "Name" = var.nat_gtw_name
    "Project" = var.project_name
  }
}
