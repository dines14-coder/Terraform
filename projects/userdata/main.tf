resource "aws_key_pair" "newkey" {
  key_name = "newkey"
  public_key = file(var.public_key)
}

resource "aws_instance" "ec2" {
  ami                     = lookup(var.Amis, var.Aws_region)
  instance_type           = "t2.micro"
  key_name = aws_key_pair.newkey.id

  user_data = file("installapache.sh")
}

output "publicip" {
  value = aws_instance.ec2.public_ip
}
