provider "azurerm" {
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features {}
}


resource "azurerm_sql_server" "example" {
  name                         = "${var.prefix}-sqlsvr"
  resource_group_name          = "${var.azure_rgname}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd!"
}

resource "azurerm_sql_database" "example" {
  name                             = "${var.prefix}-dbsql1"
  resource_group_name              = "${var.azure_rgname}"
  location                         = "${var.location}"
  server_name                      = "${azurerm_sql_server.example.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_sql_firewall_rule" "example" {
  name                = "allow-azure-services-01"
  resource_group_name = "${var.azure_rgname}"
  server_name         = "${azurerm_sql_server.example.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


resource "azurerm_sql_server" "exserver1" {
  name                         = "${var.prefix}-sqlsvr1"
  resource_group_name          = "${var.azure_rgname}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd!"
}

resource "azurerm_sql_database" "exserver1" {
  name                             = "${var.prefix}-dbsql2"
  resource_group_name              = "${var.azure_rgname}"
  location                         = "${var.location}"
  server_name                      = "${azurerm_sql_server.exserver1.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_sql_firewall_rule" "exserver1" {
  name                = "allow-azure-services-02"
  resource_group_name = "${var.azure_rgname}"
  server_name         = "${azurerm_sql_server.exserver1.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_server" "exserver2" {
  name                         = "${var.prefix}-sqlsvr2"
  resource_group_name          = "${var.azure_rgname}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd!"
}

resource "azurerm_sql_database" "exserver2" {
  name                             = "${var.prefix}-dbsql3"
  resource_group_name              = "${var.azure_rgname}"
  location                         = "${var.location}"
  server_name                      = "${azurerm_sql_server.exserver2.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_sql_firewall_rule" "exserver2" {
  name                = "allow-azure-services-03"
  resource_group_name = "${var.azure_rgname}"
  server_name         = "${azurerm_sql_server.exserver2.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


variable "prefix" {
  description = "The prefix which should be used for all resources"
  default = "pfx"
}

variable "location" {
  description = "The Azure Region in which all resources are created"
}

variable "VMSize" {
  default = "Standard_H8m"
}

variable "azure_subscription_id" {}

variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_tenant_id" {}

variable "azure_rgname" {}



