resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "first-vpc"
  }
}

resource "aws_subnet" "first-subnet-1" {
  vpc_id = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  depends_on = [ aws_vpc.first-vpc ]
  tags = {
    Name = "first-subnet-1"
  }
}

resource "aws_internet_gateway" "IGW-1" {
  vpc_id = aws_vpc.first-vpc.id
  tags = {
    Name = "IGW-1"
  }
}

resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.first-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-1.id
  }
  tags = {
    Name = "public-rtb"
  }
}

resource "aws_route_table_association" "public-rtb-1" {
  subnet_id = aws_subnet.first-subnet-1.id
  route_table_id = aws_route_table.public-rtb.id
}






