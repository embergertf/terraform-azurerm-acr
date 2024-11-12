#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Azure Container Registry variables
#--------------------------------------------------------------

# ############################   Dependencies         ############################

# / Resource Group for the Azure Container Registry
variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the `Resource Group` in which to create the Azure Container Registry."
}

# ############################   Required Variables   ############################

# None

# ############################   Optional Variables   ############################
# / Naming
variable "name_override" {
  type        = string
  description = "(Optional) Full name to override all the name generation logic. Example: 'biglittletest' will generate the resource group name \"'rg-biglittletest'\"."
  default     = null
}
variable "naming_values" {
  type = object({
    region_code     = string
    subsc_code      = string
    env             = string
    base_name       = string
    additional_name = string
    iterator        = string
    owner           = string
    additional_tags = map(string)
  })
  description = "(Optional) A terraform object with the naming values in 1 variable."
  default     = null
}
variable "region_code" {
  type        = string
  description = "(Optional) Resource region code. Must be compatible with base module. Example: `cac`."
  default     = null
}
variable "subsc_code" {
  type        = string
  description = "(Optional) Subscription code or abbreviation. Example: `azint`."
  default     = null
}
variable "env" {
  type        = string
  description = "(Optional) Environment code. Example: `test`. <br></br>&#8226; Value of `env` examples can be: `[nonprod,prod,core,int,uat,stage,dev,test]`."
  default     = null
}
variable "base_name" {
  type        = string
  description = "(Optional) Resource \"base\" name. Example: `aks`."
  default     = null
}
variable "additional_name" {
  type        = string
  description = "(Optional) Additional suffix to create resource uniqueness. It will be separated by a `'-'` from the \"name's generated\" suffix. Example: `lan1`."
  default     = null
}
variable "iterator" {
  type        = string
  description = "(Optional) Iterator to create resource uniqueness. It will be separated by a `'-'` from the \"name's generated + additional_name\" concatenation. Example: `001`."
  default     = null
}
variable "owner" {
  type        = string
  description = "(Optional) Deployed resources owner."
  default     = null
}
variable "additional_tags" {
  description = "(Optional) Additional tags for the Resource Group."
  type        = map(string)
  default     = null
}
variable "add_random" {
  type        = bool
  description = "(Optional) When set to `true`, it will add a `rnd_length`'s long `random_number` at the name's end."
  default     = false
}
variable "rnd_length" {
  type        = number
  description = "(Optional) Set the length of the `random_number` generated."
  default     = 2
}

# / Azure Container Registry specific variables
variable "sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Container Registry. Possible values are `Basic`, `Standard`, and `Premium`."
  default     = "Basic"
}
variable "admin_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the `admin user` is enabled."
  default     = false
}
variable "quarantine_policy_enabled" {
  type        = bool
  description = "(Optional) Specifies boolean value that indicates whether `quarantine policy` is enabled."
  default     = false
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the `public network access` is enabled."
  default     = true
}
variable "retention_policy_in_days" {
  type        = number
  description = "(Optional) Specifies the number of days to retain an untagged manifest after which it gets purged. Possible values are `0` to `365`."
  default     = 7
}
variable "zone_redundancy_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the `zone redundancy` is enabled."
  default     = false
}
variable "anonymous_pull_enabled" {
  type        = bool
  description = "(Optional) specifies whether allows `anonymous (unauthenticated) pull` access to this Container Registry."
  default     = false
}
variable "data_endpoint_enabled" {
  type        = bool
  description = "(Optional) specifies whether to allow `trusted Azure services` to access a network restricted Container Registry."
  default     = false
}
variable "network_rule_bypass_option" {
  type        = string
  description = "(Optional) specifies whether to allow `trusted Azure services` to access a network restricted `Container Registry`. Possible values are `None` and `AzureServices`."
  default     = "AzureServices"
}

