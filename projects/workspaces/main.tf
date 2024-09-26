# workspaces create statefile per environment.
# It helps to avoid suplicating codes



provider "aws" {
    region = "us-east-2"
}

module "ec2" {
    source = "../modules/ec2_instance"
    instancetype = lookup(var.instancetype, terraform.workspace)   # terraform.workspace function will look for the name of the workspaces and assign the value to it.
}