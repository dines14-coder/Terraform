resource "aws_security_group" "tf_ssh" {
  name        = "sg-terra-001"
  description = "security group for terraform practice"
  vpc_id      = aws_vpc.terra-vpc.id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

