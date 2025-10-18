# Terraform configuration for a virtual machine

resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Optional: Additional configuration for the VM
resource "aws_key_pair" "auth" {
  key_name   = "example-key"
  public_key = var.public_key
}

# Variables for the configuration
variable "public_key" {
  description = "Public key material for SSH access"
  type        = string
}