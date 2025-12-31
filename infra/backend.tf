terraform {
  backend "s3" {
    bucket  = "cn-web-terraform-state-saransh"
    key     = "cn-web/terraform.tfstate"
    region  = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}

