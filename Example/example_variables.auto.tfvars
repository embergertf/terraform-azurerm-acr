#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Azure Container Registry values
#--------------------------------------------------------------
naming_values = {
  region_code     = "uswe2"
  subsc_code      = "714895"
  env             = "dev"
  base_name       = "embergertf"
  additional_name = "acr"
  iterator        = "01"
  owner           = "Emm"
  additional_tags = {
    Test_by    = "Emm",
    GitHub_org = "gopher194/embergertf",
    Purpose    = "Terraform modules development"
    Module     = "Azure Container Registry"
  }
}

add_random = null
rnd_length = null

acr_additional_tags = {
  Added_by = "acr_module_localtest"
}
