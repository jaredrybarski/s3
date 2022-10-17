# if you wanna be fancy try cidrsubnet or cidrsubnets functions - https://www.terraform.io/language/functions/cidrsubnet

locals {
  subnets_pub = {
    eu-west-1a = "10.0.0.0/24"
    eu-west-1b = "10.0.1.0/24"
  }

  subnets_priv = {
    eu-west-1a = "10.0.2.0/24"
    eu-west-1b = "10.0.3.0/24"
  }
}
