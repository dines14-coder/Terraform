# we are going to create data source for availabilty_zone and then going to create intance

data "aws_availability_zones" "aws_az" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["amazon"]

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

   filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "redhat" {
  most_recent = true

  owners = ["amazon"]

  filter{
    name = "name"
    values = ["RHEL-9.4.0_HVM-20240605-x86_64-82-Hourly2-GP3"]
  }

   filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  availabilty_zone        = data.aws_availability_zones.aws_az.names[1]
}

resource "aws_instance" "ec2-1" {
  ami                     = data.aws_ami.redhat.id
  instance_type           = "t2.micro"
  availabilty_zone        = data.aws_availability_zones.aws_az.names[2]
}