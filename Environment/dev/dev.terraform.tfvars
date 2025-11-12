resource_group = {
  rg1 = {
    name       = "rg-dev-1"
    location   = "centralindia"
    managed_by = "dev_team"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }


  }
  rg2 = {
    name       = "rg-dev-2"
    location   = "centralindia"
    managed_by = "dev_team"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }


  }
}

storage_account = {
  stg1 = {
    name                     = "devstgacct1212wq"
    resource_group_name      = "rg-dev-1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }

  }
  stg2 = {
    name                     = "devstgacct2121qw"
    resource_group_name      = "rg-dev-2"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }

  }
}

vnets = {
  vnet1 = {
    vnet_name           = "dev-vnet-1"
    address_space       = ["192.168.0.0/24"]
    location            = "centralindia"
    resource_group_name = "rg-dev-1"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }
    subnets = {
      subnet1 = {
        name           = "dev-subnet-1"
        address_prefix = ["192.168.0.0/27"]
      }
    }
  }
  vnet2 = {
    vnet_name           = "dev-vnet-2"
    address_space       = ["192.168.0.0/25"]
    location            = "centralindia"
    resource_group_name = "rg-dev-2"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }
    # subnets = {
    #   subnet2 = {
    #   name           = "dev-subnet-2"
    #   address_prefix = ["192.168.0.0/27"]
    #   }
    # }
  }
}
