resource "aws_instance" "vm_random_8374" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "vm_random_8374"
  }
}