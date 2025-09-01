
output "InstancePublicIp" {
  value = aws_instance.nginxserver.public_ip
}