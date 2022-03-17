resource "azurerm_sql_server" "tfer--sql-wfp-dev-scus" {
  administrator_login          = "adminroot"
  administrator_login_password = ""
  connection_policy            = "Default"
  location                     = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-ingress-001-ct-rg-ambevtech-dev-scus-01_location}"
  name                         = "sql-wfp-dev-scus"
  resource_group_name          = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"

  threat_detection_policy {
    email_account_admins = "false"
    retention_days       = "0"
    state                = "Disabled"
  }

  version = "12.0"
}
