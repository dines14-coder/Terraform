# creating vpc
resource "aws_vpc" "ebs-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = "custom-vpc"
  }
}

#creating internet Gateway
resource "aws_internet_gateway" "ebsnetwork-ig" {
  vpc_id = aws_vpc.ebs-vpc.id

  tags = {
    Name = "ebs-network"
  }
}


resource "aws_route_table" "tf-network" {
  vpc_id = aws_vpc.ebs-vpc.id

  route{
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ebsnetwork-ig.id
  }

  tags = {
    Name = "route-table"
  }
}

# creating aws_subnet
resource "aws_subnet" "ebs-pubsub1" {
  vpc_id     = aws_vpc.ebs-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"
  

  tags = {
    Name = "Public-subnet-1"
  }
}