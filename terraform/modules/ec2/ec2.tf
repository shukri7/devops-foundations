
resource "aws_instance" "web" {
  ami           = local.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = "terraform-web-server"
  }
}

resource "aws_instance" "import" {
  ami           = local.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = "terraform-import"
  }
}
