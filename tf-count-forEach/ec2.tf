resource "aws_instance" "webInstances" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = var.instance_type
  count         = 4
  subnet_id     = aws_subnet.subnets[floor(count.index / 2)].id
  associate_public_ip_address = true
  tags = {
    Name = "WebInstance-${count.index + 1}"
}
}