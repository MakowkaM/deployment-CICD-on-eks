terraform {
    backend "s3" {
      bucket = "bucket-for-deploy-12345-1"
      key = "ec2/terraform.state"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}