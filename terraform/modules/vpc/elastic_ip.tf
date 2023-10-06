resource "aws_eip" "elastic_ip" {
  vpc = true
  tags = merge(
    var.tags
  )
}
