output "instance_ids" {
  value       = aws_instance.ec2.id
  description = "IDs of EC2 instances"
}

output "instance_pub_ip" {
  value = aws_instance.ec2.public_ip
  description = "Instance's public IP address"
}

output "instance_priv_ip" {
  value = aws_instance.ec2.private_ip
  description = "Instance's private IP address"
}
