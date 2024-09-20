resource "aws_instance" "ec2" {
  ami                     = lookup(var.Amis, var.Aws_region)
  instance_type           = "t2.micro"
}