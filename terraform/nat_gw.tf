resource "aws_nat_gateway" "NAT-gateway-0" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.subnet-public.id
  depends_on = [
    aws_eip.nat-eip
  ]
  tags = merge(
    var.env_tags.default_tags,
    {
      Name = "NAT-gateway-0"
    }
  )
}

resource "aws_eip" "nat-eip" {
  vpc = true
  tags = merge(
    var.env_tags.default_tags,
    {
      Name = "nat-eip"
    }
  )
}
