terraform {
  backend "remote" {
    organization = "hashicrop-learn-jass"
    workspaces {
      name = "new_terraform2"
    }
  }

}

provider "aws" {
  region = var.aws_region
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.KeyName
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.main.id
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  description = "Security group for the EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0f34c5ae932e6f0e4"
  instance_type          = var.InstanceType
  key_name               = var.KeyName
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "demo"
  }
}
