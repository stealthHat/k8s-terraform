# Terraform

small infrascode for my AWS cluster using [terraform](https://www.terraform.io/).


# What this repo will create 

  - A VPC module
  - A IAM module 
  - A bastion host
  - EC2 for the control plane, etcd and workers

# Runnig

If you need more control planes, etcd or workers change the [terraform.tfvars](https://github.com/stealthHat/terraform/blob/b191736b6f6479dc4466960b9a1fb59f51cc9e2b/terraform.tfvars#L13) 
then run: 
```
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```
