
resource "aws_instance" "demoInstance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
}