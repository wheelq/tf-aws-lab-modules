/*
*
* # Example: 01-public_subnets
* Creates:
* - custom vpc using the module (needed for the subnets)
* - public subnets in 3xAZs using the module
*
* ## Usage
*
* To run this example you need to execute:
*
* ```bash
* $ terraform init
* $ terraform plan
* $ terraform apply
* ```
*
*/

data "aws_availability_zones" "available" {}

module "custom_vpc" {
  source               = "../../../custom_vpc"
  name                 = var.name
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink   = var.enable_classiclink
  instance_tenancy     = var.instance_tenancy
  environment          = var.environment

}

module "public_subnets" {
  source             = "../../"
  name               = var.name
  vpc_id             = module.custom_vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  subnet_cidr_blocks = var.public_subnet_cidr_blocks
  map_public_ip      = var.public_map_public_ip
  subnet_suffix      = var.public_subnet_suffix
  subnet_tags        = var.subnet_tags
  environment        = var.environment
}

module "private_subnets" {
  source             = "../../"
  name               = var.name
  vpc_id             = module.custom_vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  subnet_cidr_blocks = var.private_subnet_cidr_blocks
  map_public_ip      = var.private_map_public_ip
  subnet_suffix      = var.private_subnet_suffix
  subnet_tags        = var.subnet_tags
  environment        = var.environment
}