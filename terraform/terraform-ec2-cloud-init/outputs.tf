
output "public_ip" {
  description = "Public IP address of the Nginx server"
  value       = aws_instance.web.public_ip
}
