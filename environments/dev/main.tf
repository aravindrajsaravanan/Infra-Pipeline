module "vpc" {
  source                   = "../../modules/vpc"
  vpc_cidr                 = "10.0.0.0/16"
  subnet_cidr              = "10.0.1.0/24"
  subnet_avaliability_zone = "${var.aws_region}a"
  env                      = "dev"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = "ami-03d3019940b16a1b2"
  instance_type = "t2.medium"
  subnet_id     = module.vpc.subnet_id
  ec2_count     = 3
  env           = "dev"
}