terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "nodes" {
  ami                    = "ami-02dc8ad50da58fffd"
  instance_type          = "t2.micro"
  key_name               = "terraform-aws"
  vpc_security_group_ids = ["sg-016c60e734ec211cc"]
  count                  = 5
  tags = {
    Name = "node${count.index}"
  }
}


resource "aws_security_group" "ssh-acess" {
  name        = "ssh-acess"
  description = "Allow ssh acess"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.249.65.42/32"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
