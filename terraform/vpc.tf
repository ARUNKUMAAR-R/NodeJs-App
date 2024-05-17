## Author : ARUNKUMAAR R
## Description : Creating VPC and SG 
## Date : 17/05/24


resource "aws_vpc" "nodejs_vpc" {
  cidr_block = var.CIDR
  tags = {
    name = "vpc-nodejs"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.nodejs_vpc.id
  cidr_block        = var.CIDR-PUBLIC 
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "nodejs_igw" {
  vpc_id = aws_vpc.nodejs_vpc.id
}



resource "aws_route_table" "public_subnet1_rt" {
  vpc_id = aws_vpc.nodejs_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nodejs_igw.id
  }
}


resource "aws_route_table_association" "public_subnet1_rt" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_subnet1_rt.id
}

resource "aws_security_group" "sg_nodejs" {
  vpc_id = aws_vpc.nodejs_vpc.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

