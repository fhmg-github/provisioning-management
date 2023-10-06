resource "aws_subnet" "subnet_public" {
  cidr_block        = cidrsubnet(output.vpc_cidr_block, 3, 0)
  vpc_id            = output.vpc_id
  availability_zone = var.az
}
