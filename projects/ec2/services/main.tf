resource "aws_instance" "ec2" {
  ami                     = lookup(var.amis, var.Aws_region)
  instance_type           = "t2.micro"
}