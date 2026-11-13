variable "instance_type" {
  type = string
}

locals {
  instance_ami = "ami-0d97d7f07b25dd693"

}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.import.id
}