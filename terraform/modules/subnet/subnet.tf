resource "aws_subnet" "subnet" {
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 1)
  vpc_id            = var.vpc_id
  availability_zone = var.az
}
