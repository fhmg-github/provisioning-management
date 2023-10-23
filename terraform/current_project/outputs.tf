output "aws_ansible_master" {
  value       = aws_instance.ansible_master.private_ip
  description = "This is the ansible_master node's private IP address"
}

output "aws_bastion_private_ip" {
  value       = aws_instance.bastion_host.private_ip
  description = "This is the bastion node's private IP address"
}

output "aws_bastion_public_ip" {
  value       = aws_instance.bastion_host.public_ip
  description = "This is the bastion node's public IP address"
}

/* output "aws_maven" {
  value       = aws_instance.maven.private_ip
  description = "This is the maven node's private IP address"
} */

output "aws_jenkins_master" {
  value       = aws_instance.jenkins_master.private_ip
  description = "This is the jenkins_master node's private IP address"
}

/* output "aws_jmeter" {
  value       = aws_instance.jmeter.private_ip
  description = "This is the jmeter node's private IP address"
}

output "aws_elastic_master" {
  value       = aws_instance.elastic_master.private_ip
  description = "This is the elastic_master node's private IP address"
}

output "aws_kibana" {
  value       = aws_instance.kibana.private_ip
  description = "This is the kibana node's private IP address"
}

output "aws_logstash" {
  value       = aws_instance.logstash.private_ip
  description = "This is the logstash node's private IP address"
}

output "aws_jfrog_oss" {
  value       = aws_instance.jfrog_oss.private_ip
  description = "This is the jfrog_oss node's private IP address" 
}*/

output "aws_windows" {
  value       = aws_instance.windows.private_ip
  description = "This is the windows' private IP address"
}
