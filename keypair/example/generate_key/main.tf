/*
*
* # Example generating new key and saving to local disk
*
* Do not use this in production!
* # Usage:
* `terraform init`
* `terraform plan`
* `terraform apply`
*
*/

module "generate_key" {
  name               = "tfdemo"
  source             = "../../"
  key_name           = "test_public_key"
  download_publickey = true
  environment        = "dev"
}