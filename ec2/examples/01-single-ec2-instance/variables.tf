variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "key_name" {
  description = "public key name"
  type        = string
  default     = ""
}

variable "public_key" {
  description = "public key value"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Enable public IP assignment to EC2 instance"
  type        = bool
}

variable "environment" {
  description = "Environment name"
  type        = string
}
