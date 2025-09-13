
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
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}

# Create Subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
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
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyInternetGateway.id
  }

  tags = {
    Name = "public_rt"
  }
}

# Create Route Table Association
resource "aws_route_table_association" "MyRouteTableAssociation" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Create EC2 Instance
resource "aws_instance" "MyInstance" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "MyInstance"
  }
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "MyNAT" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "MyNATGateway"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.MyNAT.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private_rt.id
}
