
# Example: 01-single-ec2-instance  
Creates:
- stored public key in aws
- ec2 in default vpc in all subnets

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.13.3 |
| aws | ~> 3.22.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| associate\_public\_ip\_address | Enable public IP assignment to EC2 instance | `bool` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| instance\_name | Name of the instance | `string` | n/a | yes |
| instance\_type | Instance type | `string` | n/a | yes |
| key\_name | public key name | `string` | `""` | no |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| public\_key | public key value | `string` | `""` | no |

## Outputs

No output.
