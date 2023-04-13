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
  key_name                    = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security-group-0.id]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "bastion_host"
  })
}

 resource "aws_instance" "maven" {
   ami                         = var.ami_id
   instance_type               = var.free_tier
   key_name                    = var.access_key
   associate_public_ip_address = true
   vpc_security_group_ids      = [aws_security_group.security-group-0.id]
   subnet_id                   = aws_subnet.subnet-0.id
   tags = merge(
     var.env_tags.default_tags, local.timestamp_tags,
     {
       Name = "maven"
   })
 }
 resource "aws_instance" "Jenkins_master" {
   ami                         = var.ami_id
   instance_type               = var.free_tier
   key_name                    = var.access_key
   associate_public_ip_address = true
   vpc_security_group_ids      = [aws_security_group.security-group-0.id]
   subnet_id                   = aws_subnet.subnet-0.id
   tags = merge(
     var.env_tags.default_tags, local.timestamp_tags,
     {
       Name = "jenkins_master"
   })
 }
 resource "aws_instance" "JMeter" {
   ami                         = var.ami_id
   instance_type               = var.free_tier
   key_name                    = var.access_key
   associate_public_ip_address = true
   vpc_security_group_ids      = [aws_security_group.security-group-0.id]
   subnet_id                   = aws_subnet.subnet-0.id
   tags = merge(
     var.env_tags.default_tags, local.timestamp_tags,
     {
       Name = "jmeter"
   })
 }

resource "aws_instance" "elastic_master" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.access_key
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.elastic-sg.id]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "elastic_master"
  })
}

resource "aws_instance" "kibana" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kibana-sg.id]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "kibana"
  })
}

 resource "aws_instance" "logstash" {
   ami                         = var.ami_id
   instance_type               = var.free_tier
   key_name                    = var.access_key
   associate_public_ip_address = true
   vpc_security_group_ids      = [aws_security_group.security-group-0.id]
   subnet_id                   = aws_subnet.subnet-0.id
   tags = merge(
     var.env_tags.default_tags, local.timestamp_tags,
     {
       Name = "logstash"
   })
 }
 resource "aws_instance" "jfrog_oss" {
   ami                         = var.ami_id
   instance_type               = var.free_tier
   key_name                    = var.access_key
   associate_public_ip_address = true
   vpc_security_group_ids      = [aws_security_group.security-group-0.id]
   subnet_id                   = aws_subnet.subnet-0.id
   tags = merge(
     var.env_tags.default_tags, local.timestamp_tags,
     {
       Name = "jfrog"
   })
 }
