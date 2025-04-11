resource "aws_vpc" "second-vpc" {
  cidr_block = "172.168.0.0/16"
  tags = {
    Name = "second-vpc"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.second-vpc.id
  cidr_block = "172.168.1.0/24"
  map_public_ip_on_launch = true
  depends_on = [ aws_vpc.second-vpc ]
  availability_zone = "us-east-1b"
  tags = {
    Name = "second-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.second-vpc.id

  tags = {
    Name = "second-gw"
  }
}

resource "aws_route_table" "second_route-table" {
  vpc_id = aws_vpc.second-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "second-route-table"
  }
}

resource "aws_route_table_association" "second-association" {
  route_table_id = aws_subnet.subnet-2.id
  subnet_id = aws_route_table.second_route-table.id
}

