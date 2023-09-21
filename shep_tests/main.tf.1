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

data "http" "scenario4" {
  url = "https://raw.githubusercontent.com/fchmainy/awaf_tf_docs/main/0.Appendix/scenario4.json"
  request_headers = {
  Accept = "application/json"
  }
}

resource "bigip_waf_policy" "s4_qa" {
    provider             = "bigip"
    application_language = "utf-8"
    partition            = "Common"
    name                 = "scenario4"
    template_name        = "POLICY_TEMPLATE_FUNDAMENTAL"
    type                 = "security"
    policy_import_json   = data.http.scenario4.body
}
