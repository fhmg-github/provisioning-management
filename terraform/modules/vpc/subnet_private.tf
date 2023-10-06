resource "aws_subnet" "subnet_private" {
  cidr_block        = cidrsubnet(output.vpc_cidr_block, 3, 1)
  vpc_id            = output.vpc_id
  availability_zone = var.az
}
