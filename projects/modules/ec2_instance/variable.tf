variable "aws_region" {
    default = "us-east-2"
    description = "Choose the region"
}

variable "ec2_name" {
    default = "MyInstance"
}

variable "keypair" {
    default = "newkey.pub"
    description = "need to create keys in your instance"
}

variable "instancetype" {
}