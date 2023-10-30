output "ingress_sg_id" {
  value       = aws_security_group.ingress_sg.id
  description = "ID of the created security group with ingress rule"
}

output "ingress_sg_name" {
  value       = aws_security_group.ingress_sg.name
  description = "ID of the created security group with ingress rule"
}
