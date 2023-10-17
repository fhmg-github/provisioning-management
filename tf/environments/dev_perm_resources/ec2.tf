module "demo_bastion" {
  count             = var.perm_resource ? 1 : 0
  source            = "../../modules/ec2"
  instance_name     = "bastion"
  ami_id            = var.ubuntu_ami_id
  instance_type     = var.instance_type
  subnet_id         = module.demo_pub_subnet.subnet_id
  assoc_pub_ip      = true
  access_key        = var.bastion_access_key
  private_ip        = "10.0.1.10"
  security_group_id = [aws_security_group.demo_pub_sg.id]
}