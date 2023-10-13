output "egress_sg_id" {
  value       = aws_security_group.egress_security_group.id
  description = "ID of the created security group with egress rule"
}
