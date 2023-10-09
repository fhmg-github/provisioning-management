# PUBLIC SECURITY_GROUPS
resource "aws_security_group" "ssh_security_group" {
  name   = var.security_group_name
  vpc_id = output.vpc_id

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_block
  }

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_block
  }
}
