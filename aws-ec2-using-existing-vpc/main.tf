
resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_instance" "MyInstance" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.myEexistingSubnet.id
  vpc_security_group_ids = [data.aws_security_group.nginx_sg.id]
  tags = {
    Name = "MyInstance-${random_id.random_id.hex}"
  }
}