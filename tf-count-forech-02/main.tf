
##Count Example


resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "demo_vpc"
    }
}

resource "aws_subnet" "private_subnets" {
  cidr_block = var.private_subnet_cidrs[count.index]
  vpc_id     = aws_vpc.demo_vpc.id
  count      = var.private_subnet_count
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_subnet_${count.index+1}"
  }
}

resource "aws_subnet" "public_subnets" {
  cidr_block = var.public_subnet_cidrs[count.index]
  vpc_id     = aws_vpc.demo_vpc.id
  count      = var.public_subnet_count
    availability_zone = "us-east-1b"
  tags = {
    Name = "public_subnet_${count.index+1}"
  }
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "demo_igw"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "public_route_table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
}

resource "aws_eip" "demo_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "demo_nat_gateway" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = {
    Name = "demo_nat_gateway"
  }
  depends_on = [aws_internet_gateway.demo_igw]
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "private_route_table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.demo_nat_gateway.id
  }

}

resource "aws_route_table_association" "public_route_table_association" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "private_route_table_association" {
    count          = var.private_subnet_count
    subnet_id      = aws_subnet.private_subnets[count.index].id
    route_table_id = aws_route_table.private_route_table.id
}

#----------------------------------For Each Example----------------------------------#
# For Each works with map  
resource "aws_instance" "demoInstance" {
  for_each = var.ec2_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = element(aws_subnet.public_subnets.*.id,index(keys(var.ec2_config),each.key) % length(aws_subnet.public_subnets.*.id))
  tags = {
    Name = "${each.key}"
  }
}