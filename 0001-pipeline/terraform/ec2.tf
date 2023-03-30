# resource "aws_instance" "atlantis" {
# ami                     = "${var.us-west-2-ami_id}" # us-west-2 AMI ID "ami-0ecc74eca1d66d8a6"
# instance_type           = "${var.free_tier_instance_type}"
# key_name                = "${var.us_west_1_key}"
# associate_public_ip_address =  "true"
#   vpc_security_group_ids = ["${aws_security_group.security-group-0.id}"]
#   subnet_id = "${aws_subnet.subnet-0.id}"

#   tags = {
#     Name = "Atlantis"
#     Created_by_Terraform = "True"
#     Environment = "DEV"
#     Description = "Atlantis application + Terraform"

#   }
# }

resource "aws_instance" "maven" {
  ami                         = var.us-west-2-ami_id # us-west-2 AMI ID "ami-0ecc74eca1d66d8a6"
  instance_type               = var.free_tier_instance_type
  key_name                    = var.us_west_1_key
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.security-group-0.id}"]
  subnet_id                   = aws_subnet.subnet-0.id

  # provisioner "remote-exec" {
  #    inline = [
  #     "ansible-playbook /home/fernando/projects/pipeline/ansible/install_requirements/playbook/maven.yml"
  #    ]
  # }

  # resource "null_resource" "run_ansible_playbook" {
  #   provisioner "local-exec" {
  #     command = "ansible-playbook /home/fernando/projects/pipeline/ansible/install_requirements/playbook/maven.yml"
  # }cd ..

  tags = {
    Name                 = "Maven"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "Maven build tool"

  }
}

resource "aws_instance" "Jenkins_master" {
  ami                         = var.us-west-2-ami_id
  instance_type               = var.free_tier_instance_type
  key_name                    = var.us_west_1_key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security-group-0.id]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = {
    Name                 = "jenkins-master"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "Jenkins master node"
  }
}

resource "aws_instance" "JMeter" {
  ami                         = var.us-west-2-ami_id
  instance_type               = var.free_tier_instance_type
  key_name                    = var.us_west_1_key
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.security-group-0.id}"]
  subnet_id                   = aws_subnet.subnet-0.id

  tags = {
    Name                 = "JMeter"
    Created_by_Terraform = "True"
    Environment          = "DEV"
    Description          = "JMeter node"
  }
}
