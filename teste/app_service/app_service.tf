resource "azurerm_app_service" "tfer--front-wfp" {
  app_service_plan_id = "/subscriptions/ae222fd8-af8d-4491-a10f-8b9c293a1450/resourceGroups/ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus/providers/Microsoft.Web/serverfarms/splan-worx-dev-scus-001"

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "2b9136e9-3037-440f-856a-84d98d842138"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=2b9136e9-3037-440f-856a-84d98d842138;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    WEBSITE_NODE_DEFAULT_VERSION               = "~14"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
    XDT_MicrosoftApplicationInsights_NodeJS    = "1"
  }

  auth_settings {
    enabled                       = "false"
    token_refresh_extension_hours = "0"
    token_store_enabled           = "false"
  }

  client_affinity_enabled         = "true"
  client_cert_enabled             = "false"
  client_cert_mode                = "Required"
  enabled                         = "true"
  https_only                      = "false"
  key_vault_reference_identity_id = "SystemAssigned"
  location                        = "centralus"

  logs {
    application_logs {
      file_system_level = "Off"
    }

    detailed_error_messages_enabled = "false"
    failed_request_tracing_enabled  = "false"
  }

  name                = "front-wfp"
  resource_group_name = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"

  site_config {
    acr_use_managed_identity_credentials = "false"
    always_on                            = "true"
    default_documents                    = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    dotnet_framework_version             = "v4.0"
    ftps_state                           = "AllAllowed"
    http2_enabled                        = "false"
    local_mysql_enabled                  = "false"
    managed_pipeline_mode                = "Integrated"
    min_tls_version                      = "1.2"
    number_of_workers                    = "1"
    remote_debugging_enabled             = "false"
    remote_debugging_version             = "VS2019"
    scm_type                             = "VSO"
    scm_use_main_ip_restriction          = "false"
    use_32_bit_worker_process            = "true"
    vnet_route_all_enabled               = "false"
    websockets_enabled                   = "false"
  }

  source_control {
    branch             = "development"
    manual_integration = "false"
    repo_url           = "https://AMBEV-SA@dev.azure.com/AMBEV-SA/AMBEV-APPIA/_git/front-wfp"
    rollback_enabled   = "false"
    use_mercurial      = "false"
  }
}

resource "azurerm_app_service" "tfer--ms-wfp-backend" {
  app_service_plan_id = "/subscriptions/ae222fd8-af8d-4491-a10f-8b9c293a1450/resourceGroups/ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus/providers/Microsoft.Web/serverfarms/splan-worx-dev-scus-001"

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "83a2117e-b592-4401-bac9-dfa43c41a33c"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=83a2117e-b592-4401-bac9-dfa43c41a33c;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    MSDEPLOY_RENAME_LOCKED_FILES               = "1"
    XDT_MicrosoftApplicationInsights_Mode      = "Recommended"
  }

  auth_settings {
    enabled                       = "false"
    token_refresh_extension_hours = "0"
    token_store_enabled           = "false"
  }

  client_affinity_enabled = "true"
  client_cert_enabled     = "false"
  client_cert_mode        = "Required"

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = "Server=tcp:sql-wfp-dev-scus.database.windows.net,1433;Initial Catalog=sql-wfp-dev-brs;Persist Security Info=False;User ID=adminroot;Password=teste@1234$5678;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }

  enabled                         = "true"
  https_only                      = "false"
  key_vault_reference_identity_id = "SystemAssigned"
  location                        = "centralus"

  logs {
    application_logs {
      file_system_level = "Off"
    }

    detailed_error_messages_enabled = "true"
    failed_request_tracing_enabled  = "true"
  }

  name                = "ms-wfp-backend"
  resource_group_name = "${data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--ambevtech-ambevtech-worx-fnc-rg-ambevtech-dev-scus_name}"

  site_config {
    acr_use_managed_identity_credentials = "false"
    always_on                            = "true"
    default_documents                    = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    dotnet_framework_version             = "v5.0"
    ftps_state                           = "AllAllowed"
    http2_enabled                        = "false"
    local_mysql_enabled                  = "false"
    managed_pipeline_mode                = "Integrated"
    min_tls_version                      = "1.2"
    number_of_workers                    = "1"
    remote_debugging_enabled             = "false"
    remote_debugging_version             = "VS2019"
    scm_type                             = "VSO"
    scm_use_main_ip_restriction          = "false"
    use_32_bit_worker_process            = "true"
    vnet_route_all_enabled               = "false"
    websockets_enabled                   = "false"
  }

  source_control {
    branch             = "main"
    manual_integration = "false"
    repo_url           = "https://AMBEV-SA@dev.azure.com/AMBEV-SA/AMBEV-APPIA/_git/ms-wfp-backend"
    rollback_enabled   = "false"
    use_mercurial      = "false"
  }
}
