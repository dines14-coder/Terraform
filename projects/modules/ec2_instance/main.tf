data "aws_ami" "latest-instance" {
    most_recent = true
    owners = [amazon]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}


resource "aws_instance" "ec2_module" {
    ami = data.aws_ami.latest-instance.id
    instance_type = var.instancetype
    key_name = var.keypair

    tags = {
      name = var.ec2_name
    }
  
}