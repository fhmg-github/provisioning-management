# EC2 instances

locals {
  timestamp_tags = {
    CreatedDate   = timestamp()
    ExprationDate = timeadd(timestamp(), "120h")
  }
}
resource "aws_instance" "bastion_host" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.bastion_access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security-group-0.id]
  subnet_id                   = aws_subnet.subnet-public.id

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "bastion_host"
  })
}

resource "aws_instance" "ansible_master" {
  ami                         = var.ansible_master_ami_id
  instance_type               = var.free_tier
  key_name                    = var.private_instances_access_key
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.security-group-0.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.57.13"

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "ansible_master"
  })
}

resource "aws_instance" "maven" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.private_instances_access_key
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.maven-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.49.198"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "maven"
  })
}

resource "aws_instance" "jenkins_master" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.34.210"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "jenkins_master"
  })
}
resource "aws_instance" "jmeter" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.jmeter-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.58.253"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "jmeter"
  })
}

resource "aws_instance" "elastic_master" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.elastic-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.48.116"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "elastic_master"
  })
}

resource "aws_instance" "kibana" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kibana-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.61.242"

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "kibana"
  })
}

resource "aws_instance" "logstash" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.logstash-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.35.77"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "logstash"
  })
}
resource "aws_instance" "jfrog_oss" {
  ami           = var.ami_id
  instance_type = var.free_tier
  key_name      = var.private_instances_access_key

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.jfrog-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip = "10.0.50.185"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "jfrog"
  })
}
