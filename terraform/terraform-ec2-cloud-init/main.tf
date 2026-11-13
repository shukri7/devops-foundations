
# ---------------------------------
# 1. Look up existing AWS resources
# ---------------------------------

# Find the latest Ubuntu 24.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# Find the default VPC
data "aws_vpc" "default" {
  default = true
}


# ---------------------------------
# 2. Configure the security group
# ---------------------------------

resource "aws_security_group" "web" {
  name        = "cloud-init-web-sg"
  description = "Allow HTTP access to Nginx"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "cloud-init-web-sg"
  }
}

# Allow inbound HTTP traffic on port 80
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Allow outbound traffic
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


# ---------------------------------
# 3. Create an EC2 instance
# ---------------------------------

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  # Run Cloud-init automatically on first boot
  user_data = file("${path.module}/cloud-init.yaml")

  # Replace the instance if user data changes
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-cloud-init-web"
  }
}
