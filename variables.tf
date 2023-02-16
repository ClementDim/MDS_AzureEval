variable "AZURE_RESSOURCE_LOCATION" {
  type = string
  default = "westeurope"
}

variable "AZURE_RESSOURCE_NAME" {
  type = string
  default = "cdimanchin"
}

variable "AZURE_STORAGE_CONFIG" {
  type = map(object({
    account_tier = string
  }))
  default = {
    0 = {
      account_tier = "Standard"
    }
    1 = {
      account_tier = "Premium"
    }
  }
}

variable "AZURE_SUBNETS_CONFIG" {
  type = map(object({
    ip_address = list(string)
  }))
  default = {
    0 = {
      ip_address = ["10.0.2.0/20"]
    }
    1 = {
      ip_address = ["10.0.2.0/21"]
    }
  }
}

# Get environment variables from .env file
locals {
envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
}

