#creating Ebs volume

resource "aws_ebs_volume" "EBS-1" {
  availability_zone = var.aws_az
  size              = 20
  iops = 3000
  type = gp3
  throughput = 125

  tags = {
    Name = "first-ebs-volume"
  }
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

resource "aws_instance" "ebs_ec2" {
  ami = aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = var.aws_az

  tags = {
    Name = "ebs_attached_instance"
  }

  
}
# Attaching volume to the instance
resource "aws_volume_attachment" "vol-att1" {
  device_name = "/dev/sdi"                      # here the volume name should be be /dev/sd[f-p]* for HVM machines
  volume_id   = aws_ebs_volume.EBS-1.id
  instance_id = aws_instance.ebs_ec2.id
}