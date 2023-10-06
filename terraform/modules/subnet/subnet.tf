# SUBNET
resource "aws_subnet" "subnet-public" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 0)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "subnet-public"
      CreatedDate = timestamp()
  })
}

resource "aws_subnet" "subnet-private" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "subnet-private"
      CreatedDate = timestamp()
  })
}
