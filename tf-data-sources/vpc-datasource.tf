
data "aws_vpc" "myVpc" {
  tags = {
    Name = "ProjectVpc-8c7bd775feed1015"
  }
}