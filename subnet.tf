resource "aws_subnet" "private_subnet_us_east_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
availability_zone =  "us-east-1a"
  tags = {
    "Name"                            = "private_subnet_us_east_1"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"

  }
}



resource "aws_subnet" "private_subnet_us_east_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "us-east-1b"


  tags = {
    "Name"                            = "private_subnet_us_east_1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}



resource "aws_subnet" "public_subnet_us_east_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-1"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public_subnet_us_east_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
