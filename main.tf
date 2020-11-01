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
  vpc_security_group_ids = ["var.aws_security_group.ssh-acess.id"]
  count                  = 5
  tags = {
    Name = "node${count.index}"
  }
}

/*
* Calling modules who create the initial AWS VPC / AWS ELB
* and AWS IAM Roles for Kubernetes Deployment
*/

module "aws-vpc" {
  source = "./modules/vpc"

  aws_cluster_name         = var.aws_cluster_name
  aws_vpc_cidr_block       = var.aws_vpc_cidr_block
  aws_avail_zones          = var.aws_avail_zones
  aws_cidr_subnets_private = var.aws_cidr_subnets_private
  aws_cidr_subnets_public  = var.aws_cidr_subnets_public
  default_tags             = var.default_tags
}
