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
  region = "us-east-1"
}

# VPC module
module "aws-vpc" {
  source = "./modules/vpc"

  aws_cluster_name         = var.aws_cluster_name
  aws_vpc_cidr_block       = var.aws_vpc_cidr_block
  aws_avail_zones          = var.aws_avail_zones
  aws_cidr_subnets_private = var.aws_cidr_subnets_private
  aws_cidr_subnets_public  = var.aws_cidr_subnets_public
  default_tags             = var.default_tags
}

# IAM module
module "aws-iam" {
  source = "./modules/iam"

  aws_cluster_name = var.aws_cluster_name
}

# Bastion Host
resource "aws_instance" "bastion-server" {
  ami                         = data.aws_ami.distro.id
  instance_type               = var.aws_bastion_size
  count                       = length(var.aws_cidr_subnets_public)
  availability_zone           = element(var.aws_avail_zones, count.index)
  subnet_id                   = element(module.aws-vpc.aws_subnet_ids_public, count.index)
  associate_public_ip_address = true

  vpc_security_group_ids = module.aws-vpc.aws_security_group
  key_name               = var.terraform-aws

  tags = merge(var.default_tags, map(
    "Name", "kubernetes-${var.aws_cluster_name}-bastion-${count.index}",
    "Cluster", var.aws_cluster_name,
    "Role", "bastion-${var.aws_cluster_name}-${count.index}"
  ))
}

# Etcd EC2
#resource "aws_instance" "k8s-etcd" {
#  ami                         = data.aws_ami.distro.id
#  instance_type               = var.aws_etcd_size
#  associate_public_ip_address = true
#
#  count = var.aws_etcd_num
#
#  availability_zone = element(var.aws_avail_zones, count.index)
#  subnet_id         = element(module.aws-vpc.aws_subnet_ids_private, count.index)
#
#  vpc_security_group_ids = module.aws-vpc.aws_security_group
#  #iam module miss
#  key_name = var.terraform-aws
#
#  tags = merge(var.default_tags, map(
#    "Name", "kubernetes-${var.aws_cluster_name}-etcd${count.index}",
#    "kubernetes.io/cluster/${var.aws_cluster_name}", "member",
#    "Role", "etcd"
#  ))
#}

# Master EC2 
resource "aws_instance" "k8s-master" {
  ami                         = data.aws_ami.distro.id
  instance_type               = var.aws_kube_master_size
  associate_public_ip_address = true

  count = var.aws_kube_master_num

  availability_zone = element(var.aws_avail_zones, count.index)
  subnet_id         = element(module.aws-vpc.aws_subnet_ids_private, count.index)

  vpc_security_group_ids = module.aws-vpc.aws_security_group
  iam_instance_profile   = module.aws-iam.kube-master-profile
  key_name               = var.terraform-aws

  tags = merge(var.default_tags, map(
    "Name", "kubernetes-${var.aws_cluster_name}-master${count.index}",
    "kubernetes.io/cluster/${var.aws_cluster_name}", "member",
    "Role", "master"
  ))
}

# Worker EC2
resource "aws_instance" "k8s-worker" {
  ami                         = data.aws_ami.distro.id
  instance_type               = var.aws_kube_worker_size
  associate_public_ip_address = true

  count = var.aws_kube_worker_num

  availability_zone = element(var.aws_avail_zones, count.index)
  subnet_id         = element(module.aws-vpc.aws_subnet_ids_private, count.index)

  vpc_security_group_ids = module.aws-vpc.aws_security_group

  iam_instance_profile = module.aws-iam.kube-worker-profile
  key_name             = var.terraform-aws

  tags = merge(var.default_tags, map(
    "Name", "kubernetes-${var.aws_cluster_name}-worker${count.index}",
    "kubernetes.io/cluster/${var.aws_cluster_name}", "member",
    "Role", "worker"
  ))
}
