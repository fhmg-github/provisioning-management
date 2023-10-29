variable "instance_id" {
  type        = string
  nullable = true
  description = "ID of the EC2 instance to attach eip"
}

variable "allocation_id" {
    type = string
    nullable = true
    description = "The allocation ID. This is required for EC2-VPC."
}
