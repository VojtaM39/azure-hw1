output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "public_ip_address" {
  value = azurerm_public_ip.main.ip_address
}

output "ssh_connection_command" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}

output "vm_username" {
  value = var.admin_username
}

output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}

output "acr_name" {
  value = azurerm_container_registry.main.name
}

output "acr_admin_username" {
  value = azurerm_container_registry.main.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.main.admin_password
  sensitive = true
}

output "deployment_info" {
  value = {
    vm_host           = azurerm_public_ip.main.ip_address
    vm_username       = var.admin_username
    app_url           = "http://${azurerm_public_ip.main.ip_address}"
    acr_login_server  = azurerm_container_registry.main.login_server
    acr_name          = azurerm_container_registry.main.name
  }
}

output "github_secrets_setup" {
  value = <<-EOT
    Configure the following GitHub secrets for OIDC authentication:
    
    AZURE_CLIENT_ID: ${azuread_application.github_actions.client_id}
    AZURE_TENANT_ID: ${data.azurerm_client_config.current.tenant_id}
    AZURE_SUBSCRIPTION_ID: ${data.azurerm_client_config.current.subscription_id}
    ACR_NAME: ${azurerm_container_registry.main.name}
    
    The VM will automatically deploy new images pushed to ACR within 5 minutes.
  EOT
}

output "github_oidc_config" {
  value = {
    client_id       = azuread_application.github_actions.client_id
    tenant_id       = data.azurerm_client_config.current.tenant_id
    subscription_id = data.azurerm_client_config.current.subscription_id
    acr_name        = azurerm_container_registry.main.name
  }
  description = "GitHub Actions OIDC configuration values"
}