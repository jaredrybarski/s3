

module "vpc" {
  source = "./module_vpc"
  # Try to avoid asses in code :DDDDD
  # Sth like rt_pub_association is longer, but more readable and doesn't make everyone horny
  rt_pub_association = module.vpc.subnet_pub_ids

}

module "ec2" {
  source = "./module_ec2"
  depends_on = [
    module.vpc,
    module.iam
  ]

  # I'm a fan of having one convention for vars naming, snake_case_for_terraform_should_stay_consistent
  # Leave the dashes for tags/names in cloud (tags, etc)
  machine_priv = module.vpc.subnet_priv_ids
  machine_pub  = module.vpc.subnet_pub_ids
  bucket_public = module.s3.bucket_public
  iam_profile = module.iam.RoleForEc2.arn

}

module "iam" {
source = "./module_iam"

}

module "s3" {
  source = "./module_s3"



}
