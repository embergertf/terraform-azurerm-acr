#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Azure Container Registry outputs
#--------------------------------------------------------------

# ############################   Azure Container Registry   ############################
output "acr_name" {
  value       = module.acr_module_localtest.name
  description = "Azure Container Registry name."
}
output "acr_location" {
  value       = module.acr_module_localtest.location
  description = "Azure Container Registry location."
}
output "acr_random_suffix" {
  value       = module.acr_module_localtest.random_suffix
  description = "Randomized piece of the Azure Container Registry name when \"`add_random = true`\"."
}
output "acr_tags" {
  value       = module.acr_module_localtest.tags
  description = "Azure Container Registry tags."
}


# ############################   DEBUG                ############################
output "var_naming_values" {
  value       = var.naming_values
  description = "Naming values."
}
output "rg_name" {
  value       = module.rg.name
  description = "Resource Group name."
}
output "rg_location" {
  value       = module.rg.location
  description = "Resource Group location."
}
output "rg_random_suffix" {
  value       = module.rg.random_suffix
  description = "Randomized piece of the Resource Group name when \"`add_random = true`\"."
}
output "rg_tags" {
  value       = module.rg.tags
  description = "Resource Group tags."
}
#*/
