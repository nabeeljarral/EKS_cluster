resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks_igw"
  }
}
