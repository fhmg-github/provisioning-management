output "pub_nat_gtw_id" {
  value = aws_nat_gateway.public_nat_gtw.id
}

output "pub_nat_gtw_eip_ip" {
  value = aws_nat_gateway.public_nat_gtw.public_ip
  description = "The Elastic IP address associated with the NAT Gateway."
}
