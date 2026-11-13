
output "wordpress_public_ip" {
  description = "Public IP address of the WordPress server"
  value       = aws_instance.wordpress.public_ip
}

output "wordpress_url" {
  description = "URL to access the WordPress website"
  value       = "http://${aws_instance.wordpress.public_ip}"
}

output "wordpress_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.wordpress.id
}
