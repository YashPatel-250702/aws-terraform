
data "aws_security_group" "nginx_sg" {
  tags ={
    Name = "nginx_sg-8c7bd775feed1015"
  }
}
