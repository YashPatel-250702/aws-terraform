

resource "aws_instance" "mywebserver" {
  ami           =  data.aws_ami.ec2AMI.id
  instance_type = var.instance_type
  security_groups = [ data.aws_security_group.nginx_sg.id ]
  
#optional
  tags = {
    Name = "MyWebServer"
  }
}


