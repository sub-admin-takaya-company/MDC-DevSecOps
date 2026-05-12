 # Intentionally insecure Terraform for IaC security scanning demo
 # 意図的に複数の脆弱性を仕込んだコード
 
 # Storage Account - HTTPS強制なし、パブリックアクセス許可
 resource "azurerm_storage_account" "bad_storage" {
   name                     = "insecurestorageacct"
   resource_group_name      = "example-rg"
   location                 = "japaneast"
   account_tier             = "Standard"
   account_replication_type = "LRS"
 
   enable_https_traffic_only = false          # HTTP許可（脆弱）
   allow_nested_items_to_be_public = true     # パブリックアクセス許可（脆弱）
 }
 
 # NSG - 全ポートを全世界に開放
 resource "azurerm_network_security_rule" "bad_nsg_rule" {
   name                        = "allow-all-inbound"
   priority                    = 100
   direction                   = "Inbound"
   access                      = "Allow"
   protocol                    = "*"
   source_port_range           = "*"
   destination_port_range      = "*"           # 全ポート開放（脆弱）
   source_address_prefix       = "*"           # 全世界からアクセス可（脆弱）
   destination_address_prefix  = "*"
   resource_group_name         = "example-rg"
   network_security_group_name = "example-nsg"
 }
 
 # SQL Server - 監査なし、AD管理者なし
 resource "azurerm_mssql_server" "bad_sql" {
   name                         = "insecure-sql-server"
   resource_group_name          = "example-rg"
   location                     = "japaneast"
   version                      = "12.0"
   administrator_login          = "adminuser"
   administrator_login_password = "P@ssw0rd123!"   # パスワードハードコード（脆弱）
   minimum_tls_version          = "1.0"             # 古いTLS（脆弱）
 }
