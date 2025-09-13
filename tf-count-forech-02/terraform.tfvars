region = "us-east-1"
private_subnet_count = 2
private_subnet_cidrs = [ "10.0.0.0/24", "10.0.1.0/24" ]

public_subnet_count=3
public_subnet_cidrs=["10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]

ec2_config={
  "ubuntu" = {
    instance_type = "t2.micro"
    ami           = "ami-0360c520857e3138f" 
  }
  "linux" = {
    instance_type = "t2.micro"
    ami           = "ami-0b09ffb6d8b58ca91"
  }
}