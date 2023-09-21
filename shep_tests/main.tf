  GNU nano 5.6.1                                                                            main.tf                                                                                       
terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
      version = "1.19"
    }
  }
}
provider "bigip" {
  address  = var.bigip
  username = var.username
  password = var.password
}

data "http" "shep_rdp" {
  url = "https://raw.githubusercontent.com/sh33pdog/f5-asm-policy-templates/master/Declarative/RDP.json"
  request_headers = {
  Accept = "application/json"
  }
}

resource "bigip_waf_policy" "s4_qa" {
    provider             = bigip
    application_language = "utf-8"
    partition            = "Common"
    name                 = "shep_rdp_policy"
    template_name        = "POLICY_TEMPLATE_FUNDAMENTAL"
    type                 = "security"
    policy_import_json   = data.http.shep_rdp.body
}
