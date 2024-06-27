resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = "eks-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "eks-private-route-table"
  }
}


resource "aws_route_table_association" "private_route_us_east_1" {
  subnet_id      = aws_subnet.private_subnet_us_east_1.id
  route_table_id = aws_route_table.private_route_table.id
}



resource "aws_route_table_association" "private_route_us_east_1a" {
  subnet_id      = aws_subnet.private_subnet_us_east_1a.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "public_route_us_east_1" {
  subnet_id      = aws_subnet.public_subnet_us_east_1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "public_route_us_east_1a" {
  subnet_id      = aws_subnet.public_subnet_us_east_1a.id
  route_table_id = aws_route_table.public_route_table.id
}
