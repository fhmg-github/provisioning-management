output "demo_linux_bastion_public_ip" {
  value = module.demo_bastion_eip[0].eip_ip
}

output "demo_linux_bastion_private_ip" {
  value = module.demo_bastion[0].instance_priv_ip
}

output "demo_windows_bastion_public_ip" {
  value = module.demo_windows_bastion[0].instance_pub_ip
}

output "demo_windows_bastion_private_ip" {
  value = module.demo_windows_bastion[0].instance_priv_ip
}

output "demo_jenkins_master_public_ip" {
  value = module.demo_jenkins_eip[0].eip_ip
}

output "demo_jenkins_master_private_ip" {
  value = module.demo_jenkins[0].instance_priv_ip
}

output "demo_elk_private_ip" {
  value = module.demo_elk[0].instance_priv_ip
}

output "demo_ansible_master_private_ip" {
  value = module.demo_ansible_master[0].instance_priv_ip
}

output "demo_jenkins_replica_private_ip" {
  value = module.demo_jenkins_replica[0].instance_priv_ip
}

output "demo_docker_public_ip" {
  value = module.demo_docker[0].instance_pub_ip
}

output "demo_docker_private_ip" {
  value = module.demo_docker[0].instance_priv_ip
}

output "nat_gateway_eip_associated_ip" {
  value = module.demo_pub_nat_gateway[0].pub_nat_gtw_eip_ip
}
