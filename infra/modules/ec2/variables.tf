variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
}

variable "security_group_id" {
  description = "Security Group ID to attach"
}

variable "key_name" {
  description = "EC2 key pair name"
}
