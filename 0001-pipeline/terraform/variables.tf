# variable "ami_name" {}

variable "ami_id" {
  type = string
  default = "ami-00756a2b7a21e2bd3"
  # us-west-1 ami-id
}

# variable "us_west_2_ami_id" {
#   type    = string
#   default = "ami-0223246728818f162"
# }

variable "free_tier" {
  type    = string
  default = "t2.micro"
}

variable "access_key" {
  type    = string
  default = "fhmglearningaws2-us-west-1"
  # us-west-1 key
}

variable "az" {
  type = string
  default = "us-west-1a"
}

# variable "elastic_tcp_ports" {
#   type = list
#   default = [9200, 80]
# }

# variable "kibana_tcp_ports" {
#   default = [5061]
# }

# variable "us_west_2_key" {
#   type    = string
#   default = "fhmglearningaws2"
# }
# variable "ami_key_pair" {}
# variable "availability_zone" {}