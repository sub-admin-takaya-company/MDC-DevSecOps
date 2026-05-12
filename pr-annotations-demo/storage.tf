 # Insecure storage for PR annotation demo
 
 resource "azurerm_storage_account" "pr_test" {
   name                     = "prannotationdemo"
   resource_group_name      = "example-rg"
   location                 = "japaneast"
   account_tier             = "Standard"
   account_replication_type = "LRS"
 
   enable_https_traffic_only = false
   min_tls_version           = "TLS1_0"
   allow_nested_items_to_be_public = true
 }
