/*
*
* # Example: 01-public-routing
* Creates:
*
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
  source             = "../../../subnets"
  name               = var.name
  vpc_id             = module.custom_vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  subnet_cidr_blocks = var.subnet_cidr_blocks
  map_public_ip      = var.map_public_ip
  subnet_suffix      = var.subnet_suffix
  subnet_tags        = var.subnet_tags
  environment        = var.environment
}

module "public_routing" {
  source                 = "../../"
  name                   = var.name
  vpc_id                 = module.custom_vpc.vpc_id
  subnets                = module.public_subnets.subnets_ids
  destination_cidr_block = var.destination_cidr_block
  environment            = var.environment
}