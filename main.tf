#
# Copyright 2024 Emmanuel Bergerat
#

# Created  on: #{CREATIONDATE}#
# Created  by: Emmanuel
# Modified on: 
# Modified by: 
# Overview:
#   This Azure Container Registry module:
#   - ,
#   - .
#

# -
# - Generate base for the Azure Container Registry Resource
# -
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
# https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
module "acr_base" {
  # Terraform Cloud PMR use
  source  = "app.terraform.io/embergertf/base/azurerm"
  version = "~> 4.0"

  # Naming
  name_override = var.name_override
  naming_values = var.naming_values

  region_code     = var.region_code
  subsc_code      = var.subsc_code
  env             = var.env
  base_name       = var.base_name
  additional_name = var.additional_name
  iterator        = var.iterator
  owner           = var.owner

  # Random
  add_random = var.add_random
  rnd_length = var.rnd_length

  # Azure Container Registry specifics settings
  resource_type_code = "acr"
  max_length         = 50
  no_dashes          = true
}

# -
# - Create the Azure Container Registry Resource
# -
resource "azurerm_container_registry" "this" {
  name                = lower(module.acr_base.name)
  resource_group_name = var.resource_group_name
  location            = module.acr_base.location

  quarantine_policy_enabled     = var.quarantine_policy_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option
  public_network_access_enabled = var.public_network_access_enabled
  retention_policy_in_days      = var.sku == "Premium" ? var.retention_policy_in_days : null
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled

  tags = merge(module.acr_base.tags, var.additional_tags)
  lifecycle { ignore_changes = [tags["BuiltOn"]] }
}

