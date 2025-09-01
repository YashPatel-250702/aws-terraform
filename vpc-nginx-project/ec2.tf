
resource "aws_instance" "nginxserver" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Public-Subnet.id
  vpc_security_group_ids = [ aws_security_group.nginx_sg.id ]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1> Deployed via Terraform </h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "nginxserver-${random_id.random_id.hex}"
  }
}
