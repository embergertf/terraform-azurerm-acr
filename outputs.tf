#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Azure Container Registry Outputs
#--------------------------------------------------------------

# ############################   Azure Container Registry   ############################
output "name" {
  value       = azurerm_container_registry.this.name
  description = "Azure Container Registry name."
}
output "id" {
  value       = azurerm_container_registry.this.id
  description = "Azure Container Registry ID."
}
output "resource_group_name" {
  value       = azurerm_container_registry.this.resource_group_name
  description = "Azure Container Registry Resource group name."
}
output "location" {
  value       = azurerm_container_registry.this.location
  description = "Azure Container Registry location."
}
output "tags" {
  value       = azurerm_container_registry.this.tags
  description = "Azure Container Registry tags."
}
output "random_suffix" {
  value       = module.acr_base.random_suffix
  description = "Randomized piece of the Azure Container Registry name when \"`add_random = true`\"."
}

output "login_server" {
  value       = azurerm_container_registry.this.login_server
  description = "The URL that can be used to log into the container registry."
}

output "admin_username" {
  value       = azurerm_container_registry.this.admin_username
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
}

output "admin_password" {
  value       = azurerm_container_registry.this.admin_password
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  sensitive   = true
}


/*
# ############################   Debug                ############################
output "name" {
  value       = module.acr_base.name
  description = "Azure Container Registry name."
}
output "location" {
  value       = module.acr_base.location
  description = "Azure Container Registry location."
}
output "random_suffix" {
  value       = module.acr_base.random_suffix
  description = "Randomized piece of the Azure Container Registry name when \"`add_random = true`\"."
}
output "naming_module_tags" {
  value       = module.acr_base.tags
  description = "Naming module tags."
}
#*/
