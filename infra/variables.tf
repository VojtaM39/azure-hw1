variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "webapi-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "webapi"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa_azure.pub"
}

variable "github_repository" {
  description = "GitHub repository in format 'owner/repo' for OIDC federation"
  type        = string
  default     = "your-username/your-repo"
}