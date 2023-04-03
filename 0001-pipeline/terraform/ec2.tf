# EC2 instances

resource "aws_instance" "bastion_host" {
  ami = var.ami_id
  instance_type = var.free_tier
  key_name = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.security-group-0.id}"]
  subnet_id = aws_subnet.subnet-0.id

  tags = {
    Name = "Bastion"
    Created_by_Terraform = "True"
    Environment = "DEV"
    Description = "Bastion node" 
  }
}

resource "aws_instance" "maven" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.security-group-0.id}"]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = {
    Name                 = "Maven"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "Maven build tool"

  }
}

resource "aws_instance" "Jenkins_master" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security-group-0.id]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = {
    Name                 = "jenkins-master"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "Jenkins master node"
  }
}

resource "aws_instance" "JMeter" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.security-group-0.id}"]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = {
    Name                 = "JMeter"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "JMeter node"
  }
}

resource "aws_instance" "elastic_master" {
  ami = var.ami_id
  instance_type = var.free_tier
  key_name = var.access_key
  associate_public_ip_address = false
  vpc_security_group_ids = ["${aws_security_group.elastic-sg.id}, ${aws_security_group.security-group-0.id}"]
  subnet_id = aws_subnet.subnet-0.id

  tags = {
    Name                 = "elastic-master"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "elastic_master node"
  }
}

resource "aws_instance" "kibana" {
  ami = var.ami_id
  instance_type = var.free_tier
  key_name = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.kibana-sg.id}"]
  subnet_id = aws_subnet.subnet-0.id

  tags = {
    Name                 = "kibana"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "kibana node"    
  }
}

resource "aws_instance" "logstash" {
  ami = var.ami_id
  instance_type = var.free_tier
  key_name = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.security-group-0.id}"]
  subnet_id = aws_subnet.subnet-0.id
  
  tags = {
    Name                 = "logstash"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "logstash node"    
  }
}

resource "aws_instance" "jfrog_oss" {
  ami = var.ami_id
  instance_type = var.free_tier
  key_name = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.security-group-0.id}"]
  subnet_id = aws_subnet.subnet-0.id

  tags = {
    Name                 = "jfrog_oss"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "jfrog_oss node" 
  }
}