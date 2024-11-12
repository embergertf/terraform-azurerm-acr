<!-- BEGIN_TF_DOCS -->
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

## Documentation
<!-- markdownlint-disable MD033 -->

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.7 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr_base"></a> [acr\_base](#module\_acr\_base) | app.terraform.io/embergertf/base/azurerm | ~> 4.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Name of the `Resource Group` in which to create the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_add_random"></a> [add\_random](#input\_add\_random) | (Optional) When set to `true`, it will add a `rnd_length`'s long `random_number` at the name's end. | `bool` | `false` | no |
| <a name="input_additional_name"></a> [additional\_name](#input\_additional\_name) | (Optional) Additional suffix to create resource uniqueness. It will be separated by a `'-'` from the "name's generated" suffix. Example: `lan1`. | `string` | `null` | no |
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | (Optional) Additional tags for the Resource Group. | `map(string)` | `null` | no |
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | (Optional) Specifies whether the `admin user` is enabled. | `bool` | `false` | no |
| <a name="input_anonymous_pull_enabled"></a> [anonymous\_pull\_enabled](#input\_anonymous\_pull\_enabled) | (Optional) specifies whether allows `anonymous (unauthenticated) pull` access to this Container Registry. | `bool` | `false` | no |
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | (Optional) Resource "base" name. Example: `aks`. | `string` | `null` | no |
| <a name="input_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#input\_data\_endpoint\_enabled) | (Optional) specifies whether to allow `trusted Azure services` to access a network restricted Container Registry. | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | (Optional) Environment code. Example: `test`. <br></br>&#8226; Value of `env` examples can be: `[nonprod,prod,core,int,uat,stage,dev,test]`. | `string` | `null` | no |
| <a name="input_iterator"></a> [iterator](#input\_iterator) | (Optional) Iterator to create resource uniqueness. It will be separated by a `'-'` from the "name's generated + additional\_name" concatenation. Example: `001`. | `string` | `null` | no |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | (Optional) Full name to override all the name generation logic. Example: 'biglittletest' will generate the resource group name "'rg-biglittletest'". | `string` | `null` | no |
| <a name="input_naming_values"></a> [naming\_values](#input\_naming\_values) | (Optional) A terraform object with the naming values in 1 variable. | <pre>object({<br>    region_code     = string<br>    subsc_code      = string<br>    env             = string<br>    base_name       = string<br>    additional_name = string<br>    iterator        = string<br>    owner           = string<br>    additional_tags = map(string)<br>  })</pre> | `null` | no |
| <a name="input_network_rule_bypass_option"></a> [network\_rule\_bypass\_option](#input\_network\_rule\_bypass\_option) | (Optional) specifies whether to allow `trusted Azure services` to access a network restricted `Container Registry`. Possible values are `None` and `AzureServices`. | `string` | `"AzureServices"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) Deployed resources owner. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Specifies whether the `public network access` is enabled. | `bool` | `true` | no |
| <a name="input_quarantine_policy_enabled"></a> [quarantine\_policy\_enabled](#input\_quarantine\_policy\_enabled) | (Optional) Specifies boolean value that indicates whether `quarantine policy` is enabled. | `bool` | `false` | no |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | (Optional) Resource region code. Must be compatible with base module. Example: `cac`. | `string` | `null` | no |
| <a name="input_retention_policy_in_days"></a> [retention\_policy\_in\_days](#input\_retention\_policy\_in\_days) | (Optional) Specifies the number of days to retain an untagged manifest after which it gets purged. Possible values are `0` to `365`. | `number` | `7` | no |
| <a name="input_rnd_length"></a> [rnd\_length](#input\_rnd\_length) | (Optional) Set the length of the `random_number` generated. | `number` | `2` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) Specifies the SKU of the Container Registry. Possible values are `Basic`, `Standard`, and `Premium`. | `string` | `"Basic"` | no |
| <a name="input_subsc_code"></a> [subsc\_code](#input\_subsc\_code) | (Optional) Subscription code or abbreviation. Example: `azint`. | `string` | `null` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | (Optional) Specifies whether the `zone redundancy` is enabled. | `bool` | `false` | no |

### Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_id"></a> [id](#output\_id) | Azure Container Registry ID. |
| <a name="output_location"></a> [location](#output\_location) | Azure Container Registry location. |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the container registry. |
| <a name="output_name"></a> [name](#output\_name) | Azure Container Registry name. |
| <a name="output_random_suffix"></a> [random\_suffix](#output\_random\_suffix) | Randomized piece of the Azure Container Registry name when "`add_random = true`". |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Azure Container Registry Resource group name. |
| <a name="output_tags"></a> [tags](#output\_tags) | Azure Container Registry tags. |

<!-- END_TF_DOCS -->