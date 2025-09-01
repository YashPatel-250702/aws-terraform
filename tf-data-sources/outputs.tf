output "security-group" {
   value = data.aws_security_group.nginx_sg.id
  
}
output "ami-ouput" {
   value=data.aws_ami.ec2AMI.id
}

output "vpc-output" {
   value = data.aws_vpc.myVpc.id
}

output "available-zones" {
   value = data.aws_availability_zones.available
}
output "caller_info" {
   value = data.aws_caller_identity.name
}