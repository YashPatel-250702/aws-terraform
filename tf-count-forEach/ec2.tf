resource "aws_instance" "webInstances" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = var.instance_type
  count         = 4
  subnet_id     = element(aws_subnet.subnets.*.id, count.index % length(aws_subnet.subnets))
  associate_public_ip_address = true
  tags = {
    Name = "WebInstance-${count.index + 1}"
}
}