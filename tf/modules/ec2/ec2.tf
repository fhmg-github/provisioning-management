locals {
  timestamp_tags = {
    LastChangeDate = timestamp()
    ExpiresOn      = timeadd(timestamp(), "120h")
  }
}

resource "aws_instance" "ec2_instance" {
  count                       = var.perm_resource ? 1 : 0 //To be included in documentation: set to var.temp_resource if you want to control if this resource can be destroyed later without affecting the rest of the infrastructure. Control de creation or destruction of the resource setting the temp_resource variable in the variable.tf file to true or false
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
