# Outputs
output "aws_instance_public_dns" {
  value = aws_instance.nginx-server.public_dns
}

output "aws_instance_public_ip" {
  value = aws_instance.nginx-server.public_ip
}