variable Aws_accessKey {}                           #we should save the file as terraform.tfvars which keeps the variable and the value
variable Aws_secretKey {}                          # $ dollar symbol is used for the reference. if we use that means the following will be used here  
variable Aws_region {
    default = "us-east-2"
}

variable Amis {
  type        = map
  default     = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-east-2 = "ami-05803413c51f242b7"
    us-west-1 = "ami-0454207e5367abf01"
    us-west-2 = "ami-0688ba7eeeeefe3cd"
  }

}

variable aws_sg {
  type        = list
  default     = ["sg_001", "sg_002", "sg_003" ]         
}

