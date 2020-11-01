#Global Vars
aws_cluster_name = "hatLabs"

#VPC Vars
aws_vpc_cidr_block       = "10.250.192.0/18"
aws_cidr_subnets_private = ["192.168.0.0/27", "192.168.0.32/27"]
aws_cidr_subnets_public  = ["192.168.0.64/27", "192.168.0.96/27"]
aws_avail_zones          = ["sa-east-1a", "sa-east-1b"]

default_tags = {
  Product = "hatLabs"
}
