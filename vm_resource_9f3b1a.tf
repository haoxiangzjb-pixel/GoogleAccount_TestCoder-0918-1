# Terraform configuration for a Virtual Machine

terraform {
  required_providers {
    # This example uses the 'null' provider which executes local commands.
    # Replace with your cloud provider (e.g., aws, azurerm, google).
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Data source to get the public IP of the instance (example placeholder)
data "http" "my_ip" {
  url = "http://httpbin.org/ip"
}

# Resource: A null resource to simulate a VM creation step
resource "null_resource" "vm_instance" {
  triggers = {
    # This ensures the resource is recreated if the IP changes
    ip_address = data.http.my_ip.response_body
  }

  # Provisioner to simulate actions on the VM (e.g., installing software)
  provisioner "local-exec" {
    command = "echo 'Simulating VM setup with IP: ${data.http.my_ip.response_body}' > vm_setup.log"
  }
}

# Output the simulated VM ID
output "vm_id" {
  value = null_resource.vm_instance.id
}