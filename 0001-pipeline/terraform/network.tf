
# VPC
resource "aws_vpc" "vpc-0" {
  cidr_block           = var.vpc-0-cidr-block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "vpc-0"
      CreatedDate = timestamp()
  })
}

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

# INTERNET GATEWAY

resource "aws_internet_gateway" "internet-gateway-0" {
  vpc_id = aws_vpc.vpc-0.id
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "internet-gateway-0"
      CreatedDate = timestamp()
  })
}

# ROUTING TABLE

resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-0.id
  }

  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "route-table-public"
      CreatedDate = timestamp()
  })
}

resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT-gateway-0.id
  }

  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "route-table-private"
      CreatedDate = timestamp()
    }
  )
}

# ROUTING TABLE ASSOCIATION

resource "aws_route_table_association" "route-table-association-public-subnet" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.route-table-public.id
}

resource "aws_route_table_association" "route-table-association-private-subnet" {
  subnet_id      = aws_subnet.subnet-private.id
  route_table_id = aws_route_table.route-table-private.id
}
