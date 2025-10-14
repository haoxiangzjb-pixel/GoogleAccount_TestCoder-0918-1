/*
This is a Terraform configuration file generated on 2025-01-15.
It defines a resource for a virtual machine.
*/

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t3.micro"

  tags = {
    Name = "WebServerInstance"
  }
}