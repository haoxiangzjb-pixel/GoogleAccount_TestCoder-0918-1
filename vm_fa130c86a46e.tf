# Terraform configuration for a virtual machine

terraform {
  required_version = ">= 1.0"
  required_providers {
    # Example providers - these would need to be configured for your specific cloud
    # aws, azure, google, etc.
  }
}

# Example virtual machine resource (using a generic example)
# Note: This is a template that would need to be adapted to your specific provider

# For AWS
# resource "aws_instance" "vm" {
#   ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
#   instance_type = "t2.micro"
#   
#   tags = {
#     Name = "example-vm"
#   }
# }

# For Azure (using azurerm provider)
# resource "azurerm_virtual_machine" "vm" {
#   name                  = "example-vm"
#   location              = "East US"
#   resource_group_name   = "example-rg"
#   network_interface_ids = [azurerm_network_interface.vm.id]
#   vm_size               = "Standard_B1s"
# 
#   storage_os_disk {
#     name          = "vm-os-disk"
#     caching       = "ReadWrite"
#     create_option = "FromImage"
#   }
# 
#   os_profile {
#     computer_name  = "vm"
#     admin_username = "adminuser"
#   }
# 
#   os_profile_linux_config {
#     disable_password_authentication = true
#   }
# }

# For Google Cloud (using google provider)
resource "google_compute_instance" "vm" {
  name         = "example-vm"
  machine_type = "e2-medium"
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

  metadata = {
    ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
  }

  tags = ["http-server", "https-server"]
}

# Output the VM's external IP address
output "vm_external_ip" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
}