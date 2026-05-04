terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0" 
    }
  }
  backend "http" {
    # Leave this block empty or with just the basic structure
  }
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.64.0"
  name               = var.VPC_NAME
  cidr               = var.VPC_CIDR_BLOCK
  azs                = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets    = var.VPC_PRIVATE_SUBNETS
  public_subnets     = var.VPC_PUBLIC_SUBNETS
  enable_nat_gateway = false
  enable_vpn_gateway = false
  tags = {
    Name = "${var.CLUSTER-NAME}-vpc"
  }
}