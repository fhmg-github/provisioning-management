resource "aws_nat_gateway" "nat_gtw" {
  allocation_id = var.eip_id
  subnet_id     = var.subnet_id
  /* depends_on = [
    var.elastic_ip_id
  ] */
}
