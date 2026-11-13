variable "instance_type" {
  type    = string
  default = "t3.micro"
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
}

moved {
  from = aws_instance.web
  to   = module.ec2.aws_instance.web
}

moved {
  from = aws_instance.import
  to   = module.ec2.aws_instance.import
}