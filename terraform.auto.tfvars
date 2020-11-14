#Global Vars
aws_cluster_name = "hatlabs"

#VPC Vars
aws_vpc_cidr_block       = "192.168.0.0/25"
aws_cidr_subnets_private = ["192.168.0.0/26"]
aws_cidr_subnets_public  = ["192.168.0.64/26"]
aws_avail_zones          = ["us-east-1a"]
terraform-aws            = "terraform-aws"

#ec2 user for inventory.tpl
ec2-user = "ubuntu"

# Bastion Host
aws_bastion_size = "t2.micro"

# Kubernetes Cluster
aws_kube_master_num  = 1
aws_kube_master_size = "t2.micro"

aws_etcd_num  = 1
aws_etcd_size = "t2.micro"

aws_kube_worker_num  = 2
aws_kube_worker_size = "t2.micro"

default_tags = {
  Product = "hatlabs"
}
