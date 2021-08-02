terraform {
  required_version = "> 0.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "network" {
  source = "./network"

  owner_name     = var.owner_name
  vpc_cidr_block = var.vpc_cidr_block
  sub_cidr_block = var.sub_cidr_block
}