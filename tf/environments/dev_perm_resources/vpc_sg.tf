
/* module "demo_bastion_sg" {
  source  = "../../modules/security_group"
  sg_name = "public_ssh_sg"
  vpc_id  = module.demo_vpc.vpc_id
} */
/*
module "demo_ingress_priv_ssh_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "private_ssh_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 22
  ingress_protocol        = "tcp"
  ingress_cidr_block      = []
  ingress_security_groups = []
}

module "demo_ingress_allow_ping_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "allow_ping_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = -1
  ingress_cidr_block      = ["0.0.0.0/0"]
  ingress_protocol        = "icmp"
  ingress_security_groups = []
}

module "demo_ingress_jenkins_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "jenkins_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 8080
  ingress_cidr_block      = []
  ingress_protocol        = "tcp"
  ingress_security_groups = []
}

module "demo_ingress_elastic_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "elastic_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 9200
  ingress_cidr_block      = []
  ingress_protocol        = "tcp"
  ingress_security_groups = []
}

module "demo_ingress_kibana_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "kibana_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 5106
  ingress_cidr_block      = []
  ingress_protocol        = "tcp"
  ingress_security_groups = []
}

module "demo_ingress_logstash_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "logstash_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 9600
  ingress_cidr_block      = []
  ingress_protocol        = "tcp"
  ingress_security_groups = []
}

module "demo_ingress_rdp_sg" {
  source                  = "../../modules/security_group/ingress_security_group"
  ingress_sg_name         = "rdp_sg"
  vpc_id                  = module.demo_vpc.vpc_id
  ingress_port            = 3389
  ingress_cidr_block      = ["0.0.0.0/0"]
  ingress_protocol        = "tcp"
  ingress_security_groups = []
} */