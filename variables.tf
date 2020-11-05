variable "amis" {
  default = {
    sa-east-1 = "ami-02dc8ad50da58fffd"
  }
}

variable "key_name" {
  default = "terraform-aws"
}

variable "aws_cluster_name" {
  description = "Name of AWS Cluster"
}

# AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20200907"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

//AWS VPC Variables

variable "aws_vpc_cidr_block" {
  description = "CIDR Block for VPC"
}

variable "aws_cidr_subnets_private" {
  description = "CIDR Blocks for private subnets in Availability Zones"
  type        = list
}

variable "aws_cidr_subnets_public" {
  description = "CIDR Blocks for public subnets in Availability Zones"
  type        = list
}

variable "aws_avail_zones" {
  description = "AWS Availability Zones Used"
  type        = list
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map
}
