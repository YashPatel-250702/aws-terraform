resource "aws_instance" "mywebserver" {
  ami           = var.instance_ami
  instance_type = var.instance_type

#optional
  tags = {
    Name = "MyWebServer"
  }
}
