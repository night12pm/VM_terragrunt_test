output "allow_ssh_rule_id" {
  description = "ID of the SSH allow security rule"
  value       = azurerm_network_security_rule.allow_ssh.id
}

output "allow_https_rule_id" {
  description = "ID of the HTTPS allow security rule"
  value       = azurerm_network_security_rule.allow_https.id
}
