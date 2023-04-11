module "bastion" {
  source                        = "../../modules/ec2"
  subnet_id                     = module.vpc-network.subnet_id
  vpc_id                        = module.vpc-network.vpc_id
  allow_ssh_access_from_outside = true

  tags = {
    Name        = "Bastion"
    Description = "Bastion Server"
  }
}

module "jmeter" {
  source    = "../../modules/ec2"
  subnet_id = module.vpc-network.subnet_id
  vpc_id    = module.vpc-network.vpc_id

  tags = {
    Name        = "JMeter"
    Description = "JMeter node"
  }
}

module "jenkins" {
  source    = "../../modules/ec2"
  subnet_id = module.vpc-network.subnet_id
  vpc_id    = module.vpc-network.vpc_id

  tags = {
    Name        = "Jenkins"
    Description = "Jenkins Master Node"
  }
}

module "maven" {
  source    = "../../modules/ec2"
  subnet_id = module.vpc-network.subnet_id
  vpc_id    = module.vpc-network.vpc_id

  tags = {
    Name        = "Maven"
    Description = "Maven build tool"
  }
}

module "elastic" {
  source          = "../../modules/ec2"
  subnet_id       = module.vpc-network.subnet_id
  vpc_id          = module.vpc-network.vpc_id
  security_groups = [aws_security_group.elastic-sg.id]

  tags = {
    Name        = "Elastic"
    Description = "Elastic Server"
  }
}

module "kibana" {
  source          = "../../modules/ec2"
  subnet_id       = module.vpc-network.subnet_id
  vpc_id          = module.vpc-network.vpc_id
  security_groups = [aws_security_group.kibana-sg.id]

  tags = {
    Name        = "Kibana"
    Description = "Kibana Server"
  }
}
