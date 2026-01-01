#AWS AUTHENTICATION
aws_region     = "us-east-1"

#NETWORK CONFIG 
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "us-east-1a"

# EC2 CONFIG 
ami_id        = "ami-0ecb62995f68bb549" # Ubuntu 22.04 (us-east-1)
instance_type = "t3.micro"
key_name      = "CN-Web-KeyPair"

# ECR CONFIG
ecr_repository_name = "cn-web"
