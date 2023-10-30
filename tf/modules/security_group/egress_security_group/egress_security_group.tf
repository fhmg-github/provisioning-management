resource "aws_security_group" "egress_sg" {
  name   = var.egress_sg_name
  vpc_id = var.vpc_id

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_block
  }

    lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = var.egress_sg_name
    "Project" = var.project_name
  }
}
