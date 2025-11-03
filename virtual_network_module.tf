# Virtual Network Module
# This module creates a virtual network with subnets

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_configs" {
  description = "Configuration for subnets in the virtual network"
  type        = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    }
  ]
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

# Create Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = var.environment
  }
}

# Create Subnets
resource "azurerm_subnet" "main" {
  for_each = { for idx, subnet in var.subnet_configs : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value.address_prefix]
}

output "vnet_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = [for subnet in azurerm_subnet.main : subnet.id]
}