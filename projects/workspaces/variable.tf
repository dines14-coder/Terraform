variable "aws_region" {
    default = "us-east-2"
    description = "Choose the region"
}

variable "ec2_name" {
    default = "MyInstance"
    description = "Provide a tag name for ec2 instance"
}


variable "instancetype" {
    description = "This is for instance type -eg.'t2.micro'"
    type = map(string)

    default = {
      "dev" = "t2.micro"
      "stage" = "t2.medium"
      "prod" = "t3.micro"
    }
}
