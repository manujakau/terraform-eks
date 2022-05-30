provider "aws" {
  profile = var.profile
  region  = var.aws_region
}

# Deploy Networking Resources
module "networking" {
  source       = "./networking"
  vpc_cidr     = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}


# Deploy Compute Resources
module "compute" {
  source             = "./compute"
  public_subnet_a    = module.networking.public_subnet_a
  public_subnet_b    = module.networking.public_subnet_b
  private_subnet_a   = module.networking.private_subnet_a
  private_subnet_b   = module.networking.private_subnet_b
}