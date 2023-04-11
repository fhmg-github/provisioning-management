# VPC
resource "aws_vpc" "vpc-0" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    CreatedDate = timestamp()
  }
}

# SUBNET
resource "aws_subnet" "subnet-0" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags = {
    CreatedDate = timestamp()
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet-gateway-0" {
  vpc_id = aws_vpc.vpc-0.id
  tags = {
    CreatedDate = timestamp()
  }
}

# ROUTING TABLE
resource "aws_route_table" "route-table-0" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-0.id
  }

  tags = {
    CreatedDate = timestamp()
  }
}

# ROUTING TABLE ASSOCIATION
resource "aws_route_table_association" "subnet-association-0" {
  subnet_id      = aws_subnet.subnet-0.id
  route_table_id = aws_route_table.route-table-0.id
}
