# Input variable definitions
variable "location" {
  description = "Location where target resources are to be created"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
variable "static_website_index_document" {
  description = "static website index document"
  type        = string
}
variable "static_website_error_404_document" {
  description = "static website error 404 document"
  type        = string
}

variable "file_list" {
  description = "If there are several file lists e.g. Index.html, error.html etc"
  type = list(string)
}

variable "source_file_path" {
  description = "Give path to the folder where your static web content is kept"
  type = string
}

