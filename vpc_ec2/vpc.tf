
# creating vpc
resource "aws_vpc" "terra-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = "custom-vpc"
  }
}

resource "aws_route_table" "tf-network" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "route-table"
  }
}

#creating internet Gateway
resource "aws_internet_gateway" "terranetwork-ig" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "terra-network"
  }
}

resource "aws_route_table_association" "ig-association" {
  gateway_id     = aws_internet_gateway.terranetwork-ig.id
  route_table_id = aws_route_table.tf-network.id
}

# creating aws_subnet
resource "aws_subnet" "tf-pubsub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"
  

  tags = {
    Name = "Public-subnet-1"
  }
}

#route-table association

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.tf-pubsub1.id
  route_table_id = aws_route_table.tf-network.id
}

resource "aws_subnet" "tf-pubsub2" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"

  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.tf-pubsub2.id
  route_table_id = aws_route_table.tf-network.id
}

#creating private subnet
resource "aws_subnet" "tf-prisub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name = "Private-subnet-1"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.tf-prisub1.id
  route_table_id = aws_route_table.tf-network.id
}


resource "aws_subnet" "tf-prisub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2d"

  tags = {
    Name = "Private-subnet-2"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.tf-prisub2.id
  route_table_id = aws_route_table.tf-network.id
}




