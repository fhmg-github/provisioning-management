
// VPC
resource "aws_vpc" "vpc-0" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name                 = "vpc-0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}

// SUBNET
resource "aws_subnet" "subnet-0" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc-0.id
  availability_zone = var.az
  tags = {
    Name                 = "subnet-0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}

# resource "aws_subnet" "subnet-elk" {
#   cidr_block = cidrsubnet(aws_vpc.vpc-0.cidr_block, 3, 1)
#   vpc_id = aws_vpc.vpc-0.id
#   availability_zone = var.az
#   tags = {
#     Name                 = "subnet_elk"
#     Created_by_Terraform = "True"
#     Environment          = "DEV"
#   }
# }

// SECURITY_GROUPS
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
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // "-1" it is to allow all protocols. This is commonly used in the egress rules of a security group to allow all outbound traffic.
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = {
    Name                 = "security-group-0"
    Created_by_Terraform = "True"
    Environment          = "DEV"
  }
}
// Elasticsearch security group
resource "aws_security_group" "elastic-sg" {
  name = "elastic-sg"
  vpc_id = aws_vpc.vpc-0.id

ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_groups = ["${aws_security_group.security-group-0.id}"]
  description = "Allow SSH access only from the security-group-0 where the bastion host is"
  }

ingress {
  from_port = 8
  to_port = 0
  protocol = "icmp"
  security_groups = ["${aws_security_group.security-group-0.id}"]
  description = "Allow ping from the security-group-0"
}

ingress {
  from_port = 9200
  to_port = 9200
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Elasticsearch default port"
}

egress {
  from_port = 0
  to_port = 0
  protocol = "-1" // "-1" it is to allow all protocols. This is commonly used in the egress rules of a security group to allow all outbound traffic.
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow all outbound traffic"
  }
tags = {
  Name                 = "elastic-sg"
  Created_by_Terraform = "True"
  Environment          = "DEV"
  }
}

resource "aws_security_group" "kibana-sg" {
  name = "kibana-sg"
  vpc_id = aws_vpc.vpc-0.id

ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_groups = ["${aws_security_group.security-group-0.id}"]
  description = "Allow SSH access only from the security-group-0 where the bastion host is"
}

ingress {
  from_port = 8
  to_port = 0
  protocol = "icmp"
  security_groups = ["${aws_security_group.security-group-0.id}"]
  description = "Allow ping from the security-group-0"
}

ingress {
  from_port = 5601
  to_port = 5601
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Kibana default port"
}

egress {
  from_port = 0
  to_port = 0
  protocol = "-1" // "-1" it is to allow all protocols. This is commonly used in the egress rules of a security group to allow all outbound traffic.
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow all outbound traffic"
  }
tags = {
  Name                 = "kibana-sg"
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
