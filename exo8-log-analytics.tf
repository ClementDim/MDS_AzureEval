# Create 1 log Analysis
resource "azurerm_log_analytics_workspace" "log-analytics"{
  name = var.AZURE_RESSOURCE_NAME
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic-setting" {
  name = var.AZURE_RESSOURCE_NAME
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log-analytics.id
  target_resource_id = azurerm_storage_account.storage[1].id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days = 30
    }
  }
}
