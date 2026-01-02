# VPC
resource "aws_vpc" "cn_web_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "cn-web-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "cn_web_public_subnet" {
  vpc_id                  = aws_vpc.cn_web_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "cn-web-public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "cn_web_igw" {
  vpc_id = aws_vpc.cn_web_vpc.id

  tags = {
    Name = "cn-web-igw"
  }
}

# Route Table
resource "aws_route_table" "cn_web_public_rt" {
  vpc_id = aws_vpc.cn_web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cn_web_igw.id
  }

  tags = {
    Name = "cn-web-public-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "cn_web_public_rt_assoc" {
  subnet_id      = aws_subnet.cn_web_public_subnet.id
  route_table_id = aws_route_table.cn_web_public_rt.id
}

# Security Group
resource "aws_security_group" "cn_web_sg" {
  name        = "cn-web-sg"
  description = "Allow SSH and app access"
  vpc_id      = aws_vpc.cn_web_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App Port"
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cn-web-sg"
  }
}
