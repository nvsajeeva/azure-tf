variable "azurerm_resource_group_name" {
  type        = string
  default     = "ODL-azure-1061757"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 2
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "resource_group_name" {
  type        = string
  default     = "ODL-azure-1061757"
  description = "Resource group name."
}