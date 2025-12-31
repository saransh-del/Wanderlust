terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  
}


module "cn_web_vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "cn_web_ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.cn_web_vpc.public_subnet_id
  security_group_id = module.cn_web_vpc.security_group_id
  key_name          = var.key_name
}
module "ecr_cn_web" {
  source          = "./modules/ecr"
  repository_name = "cn-web"
}
