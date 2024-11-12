# Azure Container Registry Module

## Overview

Azure Container Registry allows to build, store, and manage container images and artifacts in a private registry for all types of container deployments. Use Azure container registries with the existing container development and deployment pipelines. Use Azure Container Registry Tasks to build container images in Azure on-demand, or automate builds triggered by source code updates, updates to a container's base image, or timers. It can also be used to store `Helm charts` and to store image caches.

## Notes

- This terraform module creates one `Azure Container Registry`.

- Naming considerations:

  - `Azure Container Registry` name can only contain `alpha numeric` characters, must be between `5 and 50` characters long & should be `Globally Unique`.
  - Azure will automatically add `.azurecr.io` as suffix for `Azure Container Registry` resource name.

## Example

```yaml
module "acr_example" {
  # Local use
  #source = "../../terraform-azurerm-acr"

  # Terraform Cloud/Enterprise use
  source  = "app.terraform.io/embergertf/acr/azurerm"
  version = "~> 1.0"

  # Naming convention
  naming_values = module.rg.naming_values

  # Azure Container Registry settings
  resource_group_name = module.rg.resource_group_name
  additional_tags = var.acr_additional_tags
}
```
