
# DynamoDB for TF locks  
This module creates DynamoDB table, used for the Terraform locks  
Please go to [examples](examples)

## Usage

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment: dev/stage/prod | `string` | n/a | yes |
| name | AWS DynamoDB table for state locking | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| table\_name | The name of the DynamoDB table |
