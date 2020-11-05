# VPC outputs
output "aws_vpc" {
  value = module.aws-vpc.*
}

output "default_tags" {
  value = var.default_tags
}
