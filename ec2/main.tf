/*
*
* # EC2 module
*
*/

resource "aws_key_pair" "user_key" {
  count      = var.key_name == "" ? 0 : 1
  key_name   = var.key_name
  public_key = var.public_key
  tags = merge(
    {
      "Name" = format(
        "%s-${var.key_name}",
        var.name
      )
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_instance" "instance" {
  for_each                    = toset(var.subnet_ids)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = each.value
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids

  tags = merge(
    {
      "Name" = format(
        "%s-${var.instance_name}-${index(var.subnet_ids, each.value) + 1}",
        var.name
      )
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags,
    var.ec2_tags,
  )
}