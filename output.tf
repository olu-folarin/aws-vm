output "pubip" {
  value = aws_instance.webserver.public_ip
}