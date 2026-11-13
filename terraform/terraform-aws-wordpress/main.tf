
# Create a dedicated network for WordPress
resource "aws_vpc" "wordpress" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "wordpress-vpc"
  }
}

# Create a subnet for the WordPress server
resource "aws_subnet" "wordpress_public" {
  vpc_id                  = aws_vpc.wordpress.id
  cidr_block              = "10.20.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "wordpress-public-subnet"
  }

  availability_zone = "us-east-1a"

}

# Connect our VPC to the internet
resource "aws_internet_gateway" "wordpress" {
  vpc_id = aws_vpc.wordpress.id

  tags = {
    Name = "wordpress-igw"
  }
}

# Create a public route table
resource "aws_route_table" "wordpress_public" {
  vpc_id = aws_vpc.wordpress.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wordpress.id
  }

  tags = {
    Name = "wordpress-public-rt"
  }
}

# Connect the subnet to the route table
resource "aws_route_table_association" "wordpress_public" {
  subnet_id      = aws_subnet.wordpress_public.id
  route_table_id = aws_route_table.wordpress_public.id
}

# Security group for WordPress
resource "aws_security_group" "wordpress" {
  name        = "wordpress-web-sg"
  description = "Allow HTTP access to WordPress"
  vpc_id      = aws_vpc.wordpress.id

  tags = {
    Name = "wordpress-web-sg"
  }
}

# Allow visitors to access WordPress
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.wordpress.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Allow the server to access the internet
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.wordpress.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Find the latest Ubuntu 24.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# Create the WordPress EC2 server
resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.wordpress_public.id
  vpc_security_group_ids      = [aws_security_group.wordpress.id]
  associate_public_ip_address = true

  user_data                   = file("${path.module}/user-data.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-wordpress-server"

  }
  depends_on = [aws_route_table_association.wordpress_public]

}
