module "ec2_instance" {
    source = "../modules/ec2_instance"
    instancetype = "t2.micro"
    keypair = "newkey"
}