resource "aws_key_pair" "publickey" {
    key_name = "locked_key"
    public_key = file(var.aws_publicKey)
}

data "aws_ami" "ubuntu" {
    most_recent = "true"

    owners = ["amazon"]


    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

resource "aws_instance" "tf_instance" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name = "locked_key"
  vpc_security_group_ids = [aws_security_group.tf_ssh.id]
  subnet_id = aws_subnet.tf-pubsub2.id

  tags = {
    Name = "tf_practice"
  }


}