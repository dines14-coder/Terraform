# workspaces create statefile per environment.
# It helps to avoid suplicating codes

provider "aws" {
    region = "us-east-2"
}

module "ec2-creation" {
    source = "../modules/ec2_instance"
    newinstance = lookup(var.type_of_instance, terraform.workspace)
    ec2_name = "Workspace-instance"
    
}

#terraform.workspace function will look for the name of the workspaces and assign the value to it.