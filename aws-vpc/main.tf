
resource "random_id" "random_id" {
  byte_length = 8
}

# Create Vpc
resource "aws_vpc" "MyVPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

# Create Subnet
resource "aws_subnet" "MySubnet" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "MySubnet"
  }
}

# Create Subnet
resource "aws_subnet" "MySubnet2" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "MySubnet2"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "MyInternetGateway" {
  vpc_id = aws_vpc.MyVPC.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Create Route Table
resource "aws_route_table" "MyRouteTable" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyInternetGateway.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Create Route Table Association
resource "aws_route_table_association" "MyRouteTableAssociation" {
  subnet_id      = aws_subnet.MySubnet.id
  route_table_id = aws_route_table.MyRouteTable.id
}

# Create EC2 Instance
resource "aws_instance" "MyInstance" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.MySubnet.id

  tags = {
    Name = "MyInstance"
  }
}