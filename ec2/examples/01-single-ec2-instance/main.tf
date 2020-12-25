/*
*
* # Example: 01-single-ec2-instance
* Creates:
* - stored public key in aws
* - ec2 in default vpc in all subnets
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

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

module "ec2_instance" {
  source                      = "../../"
  name                        = var.name
  ami_id                      = data.aws_ami.amazon_linux.id
  instance_name               = var.instance_name
  instance_type               = var.instance_type
  subnet_ids                  = data.aws_subnet_ids.default.ids
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  public_key                  = var.public_key
  environment                 = var.environment
}
