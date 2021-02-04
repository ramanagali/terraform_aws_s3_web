provider "aws" {
  region    = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
}

terraform {
  required_version = ">= 0.12"
}
