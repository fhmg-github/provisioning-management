resource "aws_instance" "jenkins_master" {
  ami                         = var.ami_id
  instance_type               = var.free_tier
  key_name                    = var.private_instances_access_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.subnet-private.id
  private_ip                  = "10.0.34.210"
  tags = merge(
    var.env_tags.default_tags, local.timestamp_tags,
    {
      Name = "jenkins_master"
  })
}