variable "amis" {
  default = {
    sa-east-1 = "ami-02dc8ad50da58fffd"
  }
}

variable "key_name" {
  default = "terraform-aws"
}

//AWS VPC Variables

variable "aws_vpc_cidr_block" {
  description = "CIDR Block for VPC"
}

variable "aws_cidr_subnets_private" {
  description = "CIDR Blocks for private subnets in Availability Zones"
  type        = "list"
}

variable "aws_cidr_subnets_public" {
  description = "CIDR Blocks for public subnets in Availability Zones"
  type        = "list"
}
