resource "aws_vpc" "ProjectVpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ProjectVpc-${random_id.random_id.hex}"
  }
}

resource "aws_subnet" "Private-Subnet" {

  availability_zone = "${var.region}a"
  vpc_id = aws_vpc.ProjectVpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags ={
    Name = "Private-Subnet-${random_id.random_id.hex}"
  }
}

resource "aws_subnet" "Public-Subnet" {
  
  availability_zone = "${var.region}a"
  vpc_id = aws_vpc.ProjectVpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags ={
    Name = "Public-Subnet-${random_id.random_id.hex}"
  } 
}

resource "aws_internet_gateway" "ProjectIgw" {
  vpc_id = aws_vpc.ProjectVpc.id
  tags = {
    Name = "ProjectIgw-${random_id.random_id.hex}"
  }
}

resource "aws_route_table" "ProjectRouteTable" {
  vpc_id = aws_vpc.ProjectVpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ProjectIgw.id 
  }
  tags = {
    Name = "ProjectRouteTable-${random_id.random_id.hex}"
  }
}

resource "aws_route_table_association" "PublicSubnetAssociation" {
  subnet_id      = aws_subnet.Public-Subnet.id
  route_table_id = aws_route_table.ProjectRouteTable.id
}
