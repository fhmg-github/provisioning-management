output "id" {
  value = aws_instance.ec2_instance.id
}

output "default_security_group_id" {
  value = var.allow_ssh_access_from_outside ? aws_security_group.default_ec2_sg[0].id : null
}
