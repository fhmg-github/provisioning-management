resource "aws_instance" "jenkins_master" {
  count                       = var.create_perm_resource ? 1 : 0
  ami                         = var.jenkinsmaster_ami_id
  instance_type               = var.free_tier
  key_name                    = var.private_instances_access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip                  = "10.0.34.210"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "jenkins_master"
  })
}

locals {
  timestamp_tags = {
    LastChangeDate = timestamp()
    ExpiresOn      = timeadd(timestamp(), "120h")
  }
}

resource "aws_instance" "ec2_instance" {
  count                       = var.create_resource ? 1 : 0
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.access_key
  associate_public_ip_address = var.assoc_pub_ip
  vpc_security_group_ids      = var.security_group_id
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  tags = merge(
    var.tags, local.timestamp_tags,
  )
}
