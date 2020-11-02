output "nodes_public_ips" {
  value = [aws_instance.nodes.*.public_ip]
}

output "node_tags" {
  value = [aws_instance.nodes.*.tags.Name]
}

# VPC outputs
output "aws_vpc" {
  value = module.aws-vpc.*
}

output "default_tags" {
  value = var.default_tags
}
