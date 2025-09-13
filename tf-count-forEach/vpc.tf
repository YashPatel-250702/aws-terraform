
resource "aws_vpc" "myVpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "MyVPC"
    }
}

resource "aws_subnet" "subnets" {
  cidr_block = var.subnet1_cidr[count.index]
  vpc_id     = aws_vpc.myVpc.id
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  count      = 2
  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "myInternetGateway" {
    vpc_id = aws_vpc.myVpc.id
    tags = {
        Name = "MyInternetGateway"
    }

}

resource "aws_route_table" "myRouteTable" {
    vpc_id = aws_vpc.myVpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myInternetGateway.id
    }
    count = 2
    tags = {
        Name = "MyRouteTable-${count.index + 1}"
    }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.myRouteTable[0].id
  count          = 2
}
resource "aws_route_table_association" "association2" {
  subnet_id      = aws_subnet.subnets[2].id
  route_table_id = aws_route_table.myRouteTable[1].id
  count          = 2
}




