data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "create_sns" {
  source     = "../../"
  account_id = local.account_id
}
