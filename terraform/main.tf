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

locals {
    ruta_private_key = abspath("${path.module}/ApiMainPy.pem")
    nombre_key = "ApiMainPy"
    usuario_ssh = "ubuntu"
}

resource "aws_instance" "api_main_py" {
  ami           = "ami-036c7ef6de65ee4e9"
  instance_type = "t3.micro"
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.terraform-sg.security_group_id]
  associate_public_ip_address = true
  key_name = local.nombre_key
  tags = {
    Name = "api_main_py_instance"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Esperando conexión SSH en ${self.public_ip}'"]
    connection {
        type = "ssh"
        user = local.usuario_ssh
        private_key = file(local.ruta_private_key)
        host = self.public_ip
        timeout = "5m"
    }
  }

  provisioner "local-exec" {
    working_dir = "${path.module}/../ansible"
    command = "ansible-playbook -i ${self.public_ip}, --private-key ${local.ruta_private_key} main.yml"
  }
}