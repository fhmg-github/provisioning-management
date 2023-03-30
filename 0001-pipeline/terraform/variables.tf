# variable "ami_name" {}
variable "us-west-2-ami_id" {
  type    = string
  default = "ami-06bb3ee01d992f30d"
}

variable "free_tier_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "us_west_1_key" {
  type    = string
  default = "fhmglearningaws2-us-west-1"
}

variable "us_west_2_key" {
  type    = string
  default = "fhmglearningaws2"
}
# variable "ami_key_pair" {}
# variable "availability_zone" {}