terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "stealthHatLabs"

    workspaces {
      name = "aws-stealthHat"
    }
  }
}
