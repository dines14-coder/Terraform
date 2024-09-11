provider "aws" {
  region     = lookup(var.amis, var.Aws_region)
  access_key = "${var.Aws_accessKey}"
  secret_key = "${var.Aws_secretKey}"
}