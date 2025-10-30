# Terraform provider configuration
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Provider configuration
provider "null" {}