terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "api_main_py" {
  ami           = "ami-036c7ef6de65ee4e9"
  instance_type = "t3.micro"
  tags = {
    Name = "api_main_py_instance"
  }
}