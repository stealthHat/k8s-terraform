variable "amis" {
  default = {
    sa-east-1 = "ami-02dc8ad50da58fffd"
  }
}

variable "cdirs_remote_acess" {
  default = ["191.249.65.42/32"]
}

variable "key_name" {
  default = "terraform-aws"
}
