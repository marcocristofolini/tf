resource "azurerm_sql_database" "tfer--master-sql-wfp-dev-scus" {
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  edition                          = "Basic"
  location                         = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-ingress-001-ct-rg-ambevtech-dev-scus-01_location}"
  max_size_bytes                   = "53687091200"
  name                             = "master"
  read_scale                       = "false"
  requested_service_objective_id   = "dd6d99bb-f193-4ec1-86f2-43d3bccbc49c"
  requested_service_objective_name = "Basic"
  resource_group_name              = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"
  server_name                      = "${azurerm_sql_server.tfer--sql-wfp-dev-scus.name}"

  threat_detection_policy {
    email_account_admins = "Disabled"
    retention_days       = "0"
    state                = "Disabled"
    use_server_default   = "Disabled"
  }

  zone_redundant = "false"
}

resource "azurerm_sql_database" "tfer--sql-wfp-dev-brs-sql-wfp-dev-scus" {
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  edition                          = "Basic"
  location                         = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-ingress-001-ct-rg-ambevtech-dev-scus-01_location}"
  max_size_bytes                   = "2147483648"
  name                             = "sql-wfp-dev-brs"
  read_scale                       = "false"
  requested_service_objective_id   = "dd6d99bb-f193-4ec1-86f2-43d3bccbc49c"
  requested_service_objective_name = "Basic"
  resource_group_name              = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"
  server_name                      = "${azurerm_sql_server.tfer--sql-wfp-dev-scus.name}"

  threat_detection_policy {
    email_account_admins = "Disabled"
    retention_days       = "0"
    state                = "Disabled"
    use_server_default   = "Disabled"
  }

  zone_redundant = "false"
}
