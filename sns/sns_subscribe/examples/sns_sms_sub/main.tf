# via tfvars
# via data...
# via hardcode...

# if not hardcode, then pass via env, but no point storing in env all those vars, like no point passing port 22 for ssh. just ahrdcode it.

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "create_sns" {
  source     = "../../../sns_create"
  account_id = local.account_id
}


module "sns_sms_sub" {
  source    = "../../"
  topic_arn = module.create_sns.topic_arn
  protocol  = "sms"
  endpoint  = var.endpoint
}