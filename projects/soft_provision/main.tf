# we are going to provision software in a ec2 instance using terraform
# first we need to create the providers
# we are going to create the shell script while is going to be executed on the remote machine


resource "aws_key_pair" "ssh_key" {
  key_name = "created_key"
  public_key = file(var.path_to_pubkey)
}

resource "aws_instance" "ec2" {
  ami                     = lookup(var.Amis, var.Aws_region)
  instance_type           = "t2.micro"
  key_name = aws_key_pair.ssh_key.key_name
  provisioner "file" {
    source = "installngnix.sh"
    destination = "/tmp/installngnix.sh" 
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x installngnix.sh",
      "sudo /tmp/installngnix.sh"
     ]
  }

  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    private_key = file(var.path_to_prikey)
  }

}