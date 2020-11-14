# Cluster Name
variable "aws_cluster_name" {
  description = "Name of AWS Cluster"
}

# Ec2 User for Inventory.tlp
variable "ec2-user" {
  description = "Name of ec2 user"
}

# AMI
data "aws_ami" "distro" {
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

# AWS VPC Variables
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

variable "terraform-aws" {
  description = "SSH key"
}

# AWS EC2 Variables
variable "aws_bastion_size" {
  description = "EC2 Instance Size of Bastion Host"
}

variable "aws_kube_master_num" {
  description = "Number of Kubernetes Master Nodes"
}

variable "aws_kube_master_size" {
  description = "Instance size of Kube Master Nodes"
}

variable "aws_etcd_num" {
  description = "Number of etcd Nodes"
}

variable "aws_etcd_size" {
  description = "Instance size of etcd Nodes"
}

variable "aws_kube_worker_num" {
  description = "Number of Kubernetes Worker Nodes"
}

variable "aws_kube_worker_size" {
  description = "Instance size of Kubernetes Worker Nodes"
}

# AZ and default tags
variable "aws_avail_zones" {
  description = "AWS Availability Zones Used"
  type        = list
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map
}
