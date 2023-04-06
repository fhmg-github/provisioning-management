
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
resource "aws_subnet" "subnet-0" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "subnet-0"
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

resource "aws_route_table" "route-table-0" {
  vpc_id = aws_vpc.vpc-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-0.id
  }

  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "subnet-0"
      CreatedDate = timestamp()
  })
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

  dynamic "ingress" {
    for_each = var.external_comm
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access from outside"
    }
  }
  dynamic "egress" {
    for_each = var.allow_outboud_traffic
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.from_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = "Allow all outbound traffic"
    }
  }
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "security-group-0",
      CreatedDate = timestamp()
  })
}

# ELASTICSEARCH SG

resource "aws_security_group" "elastic-sg" {
  name   = "elastic-sg"
  vpc_id = aws_vpc.vpc-0.id

  dynamic "ingress" {
    for_each = var.internal_comm
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.security-group-0.id]
      description     = "Allow SSH access and ping only from the security-group-0"
    }
  }
  dynamic "ingress" {
    for_each = var.es_ports
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.security-group-0.id]
      description     = "Allow SSH access and ping only from the security-group-0"
    }
  }

  dynamic "egress" {
    for_each = var.allow_outboud_traffic
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.from_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = "Allow all outbound traffic"
    }
  }
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "elastic-sg"
      CreatedDate = timestamp()
  })
}

# KIBANA SG
resource "aws_security_group" "kibana-sg" {
  name   = "kibana-sg"
  vpc_id = aws_vpc.vpc-0.id

  dynamic "ingress" {
    for_each = var.internal_comm
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.security-group-0.id]
      description     = "Allow SSH access and ping only from the security-group-0"
    }
  }

  dynamic "ingress" {
    for_each = var.kibana_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      description = "Kibana default port"
    }
  }

  dynamic "egress" {
    for_each = var.allow_outboud_traffic
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.from_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = "Allow all outbound traffic"
    }
  }
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "kibana-sg"
      CreatedDate = timestamp()
  })

}
