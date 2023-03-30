
// VPC
resource "aws_vpc" "vpc-0" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name                 = "vpc_0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}

// SUBNET
resource "aws_subnet" "subnet-0" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = "us-west-1a"
  tags = {
    Name                 = "subnet_0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}

// SECURITY_GROUPS
resource "aws_security_group" "security-group-0" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    description = "Allow SSH access from the specified cidr block"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  // Terraform removes the default rule
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // "-1" it is to allow all protocols. This is commonly used in the egress rules of a security group to allow all outbound traffic.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name                 = "security_group_0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}

// ELASTIC_IP
# resource "aws_eip" "eip_0" {
#   instance = "${aws_instance.atlantis.id}"
#   vpc      = "true"
# }

# resource "aws_eip" "eip_maven" {
#   instance = "${aws_instance.maven.id}"
#   vpc      = "true"
# }

// INTERNET GATEWAY

resource "aws_internet_gateway" "internet-gateway-0" {
  vpc_id = aws_vpc.vpc-0.id
  tags = {
    Name = "internet_gateway_0"
  }
}

// ROUTING TABLE

resource "aws_route_table" "route-table-0" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-0.id
  }
  tags = {
    Name = "rounting_table_0"
  }
}
resource "aws_route_table_association" "subnet-association-0" {
  subnet_id      = aws_subnet.subnet-0.id
  route_table_id = aws_route_table.route-table-0.id
}
