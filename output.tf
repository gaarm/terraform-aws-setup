output "public_ips" {
  value = aws_instance.ec2.*.public_ip
}
