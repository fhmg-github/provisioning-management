locals {
  timestamp_tags = {
    LastChangeDate = timestamp()
    ExpiresOn      = timeadd(timestamp(), "120h")
  }
}

resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.access_key
  associate_public_ip_address = var.assoc_pub_ip
  vpc_security_group_ids      = var.security_group_id
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  iam_instance_profile        = var.iam_profile
  tags = {
    "Name"    = var.instance_name
    "Project" = var.project_name
  }
}
