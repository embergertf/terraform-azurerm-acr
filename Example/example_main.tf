#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Azure Container Registry main
#--------------------------------------------------------------
#   / Resource Group
module "rg" {
  # Terraform Cloud use
  source  = "app.terraform.io/embergertf/resourcegroup/azurerm"
  version = "~> 2.1"

  # Name override
  # name_override = var.name_override

  # Naming convention
  naming_values = var.naming_values
  # region_code     = var.region_code
  # subsc_code      = var.subsc_code
  # env             = var.env
  # base_name       = var.base_name
  # additional_name = var.additional_name
  # iterator        = var.iterator
  # owner           = var.owner

  # # Random
  # add_random = var.add_random
  # rnd_length = var.rnd_length

  # additional_tags = null
}


# / Resource to test
module "acr_module_localtest" {
  # Local use
  source = "../../terraform-azurerm-acr"

  # Naming convention
  naming_values = module.rg.naming_values

  # Azure Container Registry settings
  resource_group_name = module.rg.resource_group_name

  additional_tags = var.acr_additional_tags
}
