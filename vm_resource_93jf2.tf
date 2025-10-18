# Terraform configuration for a virtual machine

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define variables
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
}

# Virtual Machine Resource (AWS EC2 Instance)
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-vm"
  }
}

# Output the public IP of the VM
output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = aws_instance.vm.public_ip
}