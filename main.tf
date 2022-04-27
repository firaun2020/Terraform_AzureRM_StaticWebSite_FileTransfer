provider "azurerm" {
  features {

  }
}

# Creates Random String to incordporate in storage account name
resource "random_string" "rand_string" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

# Create Resource Group
resource "azurerm_resource_group" "web_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure Storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}terraform${random_string.rand_string.id}"
  resource_group_name      = azurerm_resource_group.web_rg.name
  location                 = azurerm_resource_group.web_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind

  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }

}

# Copies static web content to the storage account
resource "azurerm_storage_blob" "my_files_transfer" {
  count                  = length(var.file_list)
  name                   = "${var.file_list[count.index]}"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "${var.source_file_path}/${var.file_list[count.index]}"
}

