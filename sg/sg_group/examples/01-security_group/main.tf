/*
*
* # Example: 01-security_group
* Creates:
* - security group
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

data "aws_vpc" "default" {
  default = true
}

module "ssh_group" {
  source      = "../../"
  name        = var.name
  group_name  = var.group_name
  vpc_id      = data.aws_vpc.default.id
  description = var.description
  environment = var.environment
}