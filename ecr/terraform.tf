terraform {
    backend "s3" {
      bucket = "bucket-for-deploy-12345-1"
      key = "ecr/terraform.state"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}