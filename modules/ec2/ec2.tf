resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id # us-west-2 AMI ID "ami-0ecc74eca1d66d8a6"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id
  security_groups = var.allow_ssh_access_from_outside ? concat(
    var.security_groups,
    [aws_security_group.default_ec2_sg.*.id]
  ) : var.security_groups


  tags = merge({
    ExpiredAt = timeadd(timestamp(), "120h")
  }, var.tags)
}
