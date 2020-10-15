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
  ami                    = var.amis.sa-east-1
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.ssh-acess.id}"]
  count                  = 5
  tags = {
    Name = "node${count.index}"
  }
}
