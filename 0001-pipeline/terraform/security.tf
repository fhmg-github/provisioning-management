# SECURITY_GROUPS
resource "aws_security_group" "security-group-0" {
  name   = "allow-all-ssh_access"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from outside"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ping from outside"
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
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

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH access only from the security-group-0"
  }

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow ping only from the security-group-0"
  }
  ingress {
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH access only from the security-group-0"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
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

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH only from the security-group-0"
  }

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow ping only from the security-group-0"
  }
  ingress {
    from_port       = 5106
    to_port         = 5106
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH only from the security-group-0"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = merge(
    var.env_tags.default_tags,
    {
      Name        = "kibana-sg"
      CreatedDate = timestamp()
  })

}
