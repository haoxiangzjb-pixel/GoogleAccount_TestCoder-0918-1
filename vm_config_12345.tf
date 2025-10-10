# Ресурс для виртуальной машины (пример для AWS EC2)
resource "aws_instance" "my_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI (Ohio region)
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformVM"
  }
}