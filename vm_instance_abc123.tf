# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - this would depend on your cloud provider
    # For AWS, Azure, GCP, etc.
  }
}

# Example virtual machine resource (AWS EC2 instance)
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Example virtual machine resource (Google Cloud Compute Engine)
/*
resource "google_compute_instance" "example_vm" {
  name         = "example-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral IP
    }
  }
}
*/

# Example virtual machine resource (Azure Virtual Machine)
/*
resource "azurerm_virtual_machine" "example_vm" {
  name                  = "example-vm"
  location              = "East US"
  resource_group_name   = "example-rg"
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
*/