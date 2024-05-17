variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "CIDR" {
  default = "15.0.0.0/16"
}

variable "CIDR-PUBLIC" {
  default = "15.0.0.0/16"
}

