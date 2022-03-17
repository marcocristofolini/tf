resource "azurerm_sql_firewall_rule" "tfer--AllowAllWindowsAzureIps" {
  end_ip_address      = "0.0.0.0"
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"
  server_name         = "${azurerm_sql_server.tfer--sql-wfp-dev-scus.name}"
  start_ip_address    = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "tfer--App-0020-Service" {
  end_ip_address      = "20.118.48.3"
  name                = "App Service"
  resource_group_name = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"
  server_name         = "${azurerm_sql_server.tfer--sql-wfp-dev-scus.name}"
  start_ip_address    = "20.118.48.3"
}
