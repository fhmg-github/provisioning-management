
# VPC
resource "aws_vpc" "vpc-0" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.global_tags, { Name = "vpc-0" }, { CreatedDate = timestamp() })
}

# SUBNET
resource "aws_subnet" "subnet-0" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags              = merge(var.global_tags, { Name = "subnet-0" }, { CreatedDate = timestamp() })
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "internet-gateway-0" {
  vpc_id = aws_vpc.vpc-0.id
  tags   = merge(var.global_tags, { Name = "internet-gateway-0" }, { CreatedDate = timestamp() })
}

# ROUTING TABLE

resource "aws_route_table" "route-table-0" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-0.id
  }

  tags = merge(var.global_tags, { Name = "subnet-0" }, { CreatedDate = timestamp() })
}

# ROUTING TABLE ASSOCIATION

resource "aws_route_table_association" "subnet-association-0" {
  subnet_id      = aws_subnet.subnet-0.id
  route_table_id = aws_route_table.route-table-0.id
}

# SECURITY_GROUPS
resource "aws_security_group" "security-group-0" {
  name   = "allow-all-ssh_access"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from the specified cidr block"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = merge(var.global_tags, { Name = "security-group-0" }, { CreatedDate = timestamp() })
}

# ELASTICSEARCH SG

resource "aws_security_group" "elastic-sg" {
  name   = "elastic-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    # from_port       = 22
    # to_port         = 22
    # protocol        = "tcp"
    # security_groups = ["${aws_security_group.security-group-0.id}"]
    # var.ingress_ssh_bastion
    description = "Allow SSH access only from the security-group-0 where the bastion host is"
  }

  ingress {
    from_port       = 8
    to_port         = 0
    protocol        = "icmp"
    security_groups = ["${aws_security_group.security-group-0.id}"]
    description     = "Allow ping from the security-group-0"
  }

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Elasticsearch default port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = merge(var.global_tags, { Name = "elastic-sg" }, { CreatedDate = timestamp() })
}

# KIBANA SG
resource "aws_security_group" "kibana-sg" {
  name   = "kibana-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.security-group-0.id}"]
    description     = "Allow SSH access only from the security-group-0 where the bastion host is"
  }

  ingress {
    from_port       = 8
    to_port         = 0
    protocol        = "icmp"
    security_groups = ["${aws_security_group.security-group-0.id}"]
    description     = "Allow ping from the security-group-0"
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Kibana default port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = merge(var.global_tags, { Name = "kibana-sg" }, { CreatedDate = timestamp() })

}