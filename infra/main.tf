terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-south-2"
}

resource "aws_security_group" "api_sg" {
  name        = "api_security_group"
  description = "Grupo de seguridad para la API DevSecOps"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

resource "aws_instance" "api_server" {
  ami             = "ami-0c55b159cbfafe1f0" 
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.api_sg.name]

  tags = {
    Name = "Servidor-API-DevSecOps"
  }
}