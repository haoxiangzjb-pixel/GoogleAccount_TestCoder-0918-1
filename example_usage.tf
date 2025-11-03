# Example usage of the virtual network module

provider "azurerm" {
  features {}
}

# Define resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Use the virtual network module
module "virtual_network" {
  source                = "./virtual_network_module"  # This would reference the module file
  vnet_name             = "example-vnet"
  resource_group_name   = azurerm_resource_group.example.name
  resource_group_location = azurerm_resource_group.example.location
  environment           = "dev"

  vnet_address_space = ["10.0.0.0/16"]

  subnet_configs = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.0.2.0/24"
    }
  ]
}

output "vnet_id" {
  value = module.virtual_network.vnet_id
}

output "subnet_ids" {
  value = module.virtual_network.subnet_ids
}