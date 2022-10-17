# Best practice in our case would be to used named AWS profiles

provider "aws" {
  region  = "eu-west-1"
  profile = "jarry"
}
