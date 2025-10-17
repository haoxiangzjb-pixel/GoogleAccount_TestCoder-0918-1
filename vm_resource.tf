# Terraform configuration for a virtual machine

resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Output the instance ID
output "instance_id" {
  value = aws_instance.example_vm.id
}

# Output the public IP
output "public_ip" {
  value = aws_instance.example_vm.public_ip
}