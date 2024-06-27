resource "aws_eip" "nat-us" {
 

}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat-us.id
  subnet_id     = aws_subnet.public_subnet_us_east_1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]

}
