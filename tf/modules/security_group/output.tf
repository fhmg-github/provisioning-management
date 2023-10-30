output "sg_id" {
  value       = aws_security_group.sg.id
  description = "ID of the created security group with ingress rule"
}

output "sg_name" {
  value       = aws_security_group.sg.name
  description = "ID of the created security group with ingress rule"
}
