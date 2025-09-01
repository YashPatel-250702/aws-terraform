

terraform {
  required_providers {
    aws= {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "example" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  count        = 5

  tags = {
    Name = "ExampleInstance-${count.index}"
  }
}