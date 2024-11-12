#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Azure Container Registry required Terraform providers with their versions
#--------------------------------------------------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7"
    }
  }
}
