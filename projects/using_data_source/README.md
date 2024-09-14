# Terraform
# Data source :
 Data source is used to assign the dynamic values like aws_ami, availability zone _public ip and we can print it in the run time also.

# aws_ami owners:
 owners = ["amazon"]  # amazon is providing this ami so we should use the amazon name  here.
                       # if we have our own ami we should write ["self"] there.

# filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]       
     # we need to give the ami name .[eg. ubuntu,redhat, amazon-linux etc..,] we can refer documents to write this value
     document link - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html

  }

# wildcard :
  this '*' symbol is called the wildcard. we use it for our flexibility. if we dont know or not sure about the next part of the or something, we can use this * . This will bring the possible fields to it
    # for eg.., we can write the redhat name like this RHEL-9.4.0_HVM- "*"  this will attach the possible suffix

