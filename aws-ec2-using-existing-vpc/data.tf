
# getting VPC Data
data "aws_vpc" "myExistingVpc" {

  filter {
    name   = "tag:Name"
    values = ["ProjectVpc-45333d87532bd237"]
  }
}

#getting Subnet data
data "aws_subnet" "myEexistingSubnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.myExistingVpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["Private-Subnet-45333d87532bd237"]
  }
}

#getting security group
data "aws_security_group" "nginx_sg" {
    filter {
      name   = "tag:Name"
      values = ["nginx_sg-45333d87532bd237"]
    }
}
