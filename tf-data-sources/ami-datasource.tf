

#Getting random ami from aws
data "aws_ami" "ec2AMI" {
  most_recent = true
  owners = [ "amazon" ]
  
}
