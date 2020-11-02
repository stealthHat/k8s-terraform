output "aws_vpc_id" {
  value = aws_vpc.cluster-vpc.*
}

output "aws_subnet_ids_private" {
  value = aws_subnet.cluster-vpc-subnets-private.*
}

output "aws_subnet_ids_public" {
  value = aws_subnet.cluster-vpc-subnets-public.*
}

output "aws_security_group" {
  value = aws_security_group.kubernetes.*
}

output "default_tags" {
  value = var.default_tags
}
