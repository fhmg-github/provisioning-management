# PUBLIC SECURITY_GROUPS
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

# MAVEN SECURITY GROUP
resource "aws_security_group" "maven-sg" {
  name   = "maven-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH access only from the security-group-0"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    #security_groups = [aws_security_group.security-group-0.id, aws_security_group.jenkins-sg.id]
    description = "Allow ping only from the security-group-0"
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
      Name        = "maven-sg"
      CreatedDate = timestamp()
  })
}

# JENKINS SECURITY GROUP
resource "aws_security_group" "jenkins-sg" {
  name   = "jenkins-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH access only from the security-group-0"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id, aws_security_group.windows-sg.id]
    description     = "Allow Jenkins access only from the security-group-0"
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
      Name        = "jenkins-sg"
      CreatedDate = timestamp()
  })
}

# MAVEN SECURITY GROUP
resource "aws_security_group" "jmeter-sg" {
  name   = "jmeter-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH access only from the security-group-0"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
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
      Name        = "jmeter-sg"
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
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
  }

  ingress {
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow ES access only from the security-group-0"
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
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
  }

  ingress {
    from_port       = 5106
    to_port         = 5106
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow access to Kibana only from the security-group-0"
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

# LOGSTASH SG
resource "aws_security_group" "logstash-sg" {
  name   = "logstash-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH only from the security-group-0"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
  }

  ingress {
    from_port       = 9600
    to_port         = 9600
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow access to Kibana only from the security-group-0"
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
      Name        = "logstash-sg"
      CreatedDate = timestamp()
  })
}

# JFROG SG
resource "aws_security_group" "jfrog-sg" {
  name   = "jfrog-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow SSH only from the security-group-0"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
  }

  ingress {
    from_port       = 9600
    to_port         = 9600
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group-0.id]
    description     = "Allow access to Kibana only from the security-group-0"
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
      Name        = "jfrog-sg"
      CreatedDate = timestamp()
  })
}

resource "aws_security_group" "windows-sg" {
  name   = "windows-sg"
  vpc_id = aws_vpc.vpc-0.id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH only from the security-group-0"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc-0.cidr_block]
    description = "Allow ping only from the security-group-0"
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
      Name        = "windows-sg"
      CreatedDate = timestamp()
  })
}