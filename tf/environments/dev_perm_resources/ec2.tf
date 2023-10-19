module "demo_bastion" {
  count         = var.ec2_perm_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_bastion"
  ami_id        = var.ubuntu_ami_id
  instance_type = var.instance_type
  subnet_id     = module.demo_pub_subnet.subnet_id
  assoc_pub_ip  = true
  access_key    = var.bastion_access_key
  private_ip    = "10.0.1.10"
  security_group_id = [
    aws_security_group.demo_pub_sg.id
  ]
}

module "demo_windows_bastion" {
  count         = var.ec2_perm_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_win_bastion"
  ami_id        = var.windows_ami_id
  instance_type = var.instance_type
  subnet_id     = module.demo_pub_subnet.subnet_id
  assoc_pub_ip  = true
  access_key    = var.bastion_access_key
  private_ip    = "10.0.1.11"
  security_group_id = [
    aws_security_group.demo_windows_sg.id
  ]
}

module "demo_jenkins" {
  count         = var.ec2_perm_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_jenkins_master"
  ami_id        = "ami-01678e9ec0086563e"
  instance_type = var.instance_type
  subnet_id     = module.demo_pub_subnet.subnet_id
  assoc_pub_ip  = true
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.1.12"
  security_group_id = [
    aws_security_group.demo_jenkins_sg.id,
    aws_security_group.demo_windows_sg.id
  ]
}

module "demo_jenkins_replica" {
  count         = var.ec2_temp_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_jenkins_replica"
  ami_id        = var.ubuntu_ami_id
  instance_type = var.instance_type
  subnet_id     = module.demo_pub_subnet.subnet_id
  assoc_pub_ip  = true
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.1.13"
  security_group_id = [
    aws_security_group.demo_jenkins_sg.id,
    aws_security_group.demo_windows_sg.id
  ]
}

module "demo_elk" {
  count         = var.ec2_temp_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_elk"
  ami_id        = var.ubuntu_ami_id
  instance_type = var.elk_instance_type
  subnet_id     = module.demo_priv_subnet.subnet_id
  assoc_pub_ip  = false
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.32.11"
  security_group_id = [
    aws_security_group.elk_sg.id
  ]
}

module "demo_ansible_master" {
  count         = var.ec2_perm_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_ansible_master"
  ami_id        = "ami-07a3897f7c54026c9"
  instance_type = var.instance_type
  subnet_id     = module.demo_priv_subnet.subnet_id
  assoc_pub_ip  = false
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.32.12"
  security_group_id = [
    aws_security_group.demo_ansible_master_sg.id,
    aws_security_group.demo_windows_sg.id
  ]
}

module "demo_maven" {
  count         = var.ec2_temp_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_maven"
  ami_id        = var.ubuntu_ami_id
  instance_type = var.instance_type
  subnet_id     = module.demo_priv_subnet.subnet_id
  assoc_pub_ip  = false
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.32.13"
  security_group_id = [
    aws_security_group.demo_maven_sg.id,
    aws_security_group.demo_windows_sg.id
  ]
}

module "demo_jmeter" {
  count         = var.ec2_temp_resource ? 1 : 0
  source        = "../../modules/ec2"
  instance_name = "demo_jmeter"
  ami_id        = var.ubuntu_ami_id
  instance_type = var.instance_type
  subnet_id     = module.demo_priv_subnet.subnet_id
  assoc_pub_ip  = false
  access_key    = var.private_instances_access_key
  private_ip    = "10.0.32.14"
  security_group_id = [
    aws_security_group.demo_jmeter_sg.id,
    aws_security_group.demo_windows_sg.id
  ]
}