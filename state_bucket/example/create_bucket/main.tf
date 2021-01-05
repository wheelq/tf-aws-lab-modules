# Usage: N/A

module "state_bucket" {
  source = "../../"
  name   = "changeme"
  # ENVs
  environment = "prod"
}