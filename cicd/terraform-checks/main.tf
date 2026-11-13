
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "ci_demo" {
  cidr_block         = "10.20.0.0/16"
  enable_dns_support = true

  tags = {
    Name = "cicd-validation-demo"
  }
}
