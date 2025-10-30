# Terraform module to create a virtual network

# Define the required providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Define input variables
variable "resource_group_name" {
  description = "The name of the resource group to deploy the virtual network into"
  type        = string
}

variable "location" {
  description = "The location/region where the virtual network will be deployed"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "my-vnet"
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# Create the virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = "Development"
    Project     = "Terraform-VNet"
  }
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}

# Output the virtual network ID
output "vnet_id" {
  description = "The ID of the created virtual network"
  value       = azurerm_virtual_network.vnet.id
}

# Output the subnet ID
output "subnet_id" {
  description = "The ID of the created subnet"
  value       = azurerm_subnet.subnet.id
}