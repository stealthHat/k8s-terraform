#Global Vars
aws_cluster_name = "hatlabs"

#VPC Vars
aws_vpc_cidr_block       = "192.168.0.0/25"
aws_cidr_subnets_private = ["192.168.0.0/26"]
aws_cidr_subnets_public  = ["192.168.0.64/26"]
aws_avail_zones          = ["sa-east-1a"]

default_tags = {
  Product = "hatLabs"
}
