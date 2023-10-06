resource "aws_subnet" "subnet_private" {
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 3, 1)
  vpc_id            = output.vpc_id
  availability_zone = var.az
  tags = merge(
    var.tags
  )
}
