output "ec2_public_ip" {
  description = "Public IP of CN-Web EC2 instance"
  value       = module.cn_web_ec2.public_ip
}
output "ecr_repository_url" {
  value = module.ecr_cn_web.repository_url
}

