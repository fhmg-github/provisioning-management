resource "aws_security_group" "elastic-sg" {
  name   = "elastic-sg"
  vpc_id = module.vpc-network.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow SSH access only from the security-group-0"
  }

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow ping only from the security-group-0"
  }
  ingress {
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow SSH access only from the security-group-0"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "elastic-sg"
  }
}

# KIBANA SG
resource "aws_security_group" "kibana-sg" {
  name   = "kibana-sg"
  vpc_id = module.vpc-network.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow SSH only from the security-group-0"
  }

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow ping only from the security-group-0"
  }
  ingress {
    from_port       = 5106
    to_port         = 5106
    protocol        = "tcp"
    security_groups = [module.bastion.default_security_group_id]
    description     = "Allow SSH only from the security-group-0"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "kibana-sg"
  }
}
