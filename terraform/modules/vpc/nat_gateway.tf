resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = output.elastic_ip_id
  subnet_id     = output.public_subnet_id
  depends_on = [
    output.elastic_ip_id
  ]
}
