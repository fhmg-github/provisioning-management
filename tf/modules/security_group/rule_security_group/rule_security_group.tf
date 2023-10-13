resource "aws_security_group_rule" "sg_group_rule" {
  type = var.type
  from_port = var.port
  to_port = var.port
  protocol = var.protocol
  cidr_blocks = var.cidr_blocks
  security_group_id = var.security_groups
}