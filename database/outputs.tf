output "azurerm_sql_database_tfer--master-sql-wfp-dev-scus_id" {
  value = "${azurerm_sql_database.tfer--master-sql-wfp-dev-scus.id}"
}

output "azurerm_sql_database_tfer--sql-wfp-dev-brs-sql-wfp-dev-scus_id" {
  value = "${azurerm_sql_database.tfer--sql-wfp-dev-brs-sql-wfp-dev-scus.id}"
}

output "azurerm_sql_firewall_rule_tfer--AllowAllWindowsAzureIps_id" {
  value = "${azurerm_sql_firewall_rule.tfer--AllowAllWindowsAzureIps.id}"
}

output "azurerm_sql_firewall_rule_tfer--App-0020-Service_id" {
  value = "${azurerm_sql_firewall_rule.tfer--App-0020-Service.id}"
}

output "azurerm_sql_server_tfer--sql-wfp-dev-scus_id" {
  value = "${azurerm_sql_server.tfer--sql-wfp-dev-scus.id}"
}
