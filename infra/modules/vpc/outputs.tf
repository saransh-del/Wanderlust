output "vpc_id" {
  value = aws_vpc.cn_web_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.cn_web_public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.cn_web_sg.id
}
