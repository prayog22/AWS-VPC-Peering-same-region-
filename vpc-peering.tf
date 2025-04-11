resource "aws_vpc_peering_connection" "peering-connection" {
  peer_owner_id = "767165333616"
  peer_vpc_id = aws_vpc.first-vpc.id
  vpc_id = aws_vpc.second-vpc.id
  peer_region = "us-east-1"
  auto_accept = false
  tags = {
    Name = "VPC Peering between first-vpc and second-vpc"
 }
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peering-connection.id
  auto_accept = true
  tags = {
    Side = "Accepter"
 }
}

