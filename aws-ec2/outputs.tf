output "aws_instance_publicId" {
  value = aws_instance.mywebserver.public_ip
}