resource_group = {
  rg1 = {
    name       = "rg-prod-1"
    location   = "centralindia"
    managed_by = "prod_team"
    tags = {
      Owner       = "DevOps Team"
      Environment = "prod"
      Project     = "infrastructure prodelopment"
    }


  }
  rg2 = {
    name       = "rg-prod-2"
    location   = "centralindia"
    managed_by = "prod_team"
    tags = {
      Owner       = "prodOps Team"
      Environment = "prod"
      Project     = "infrastructure deployment"
    }


  }
}

storage_account = {
  stg1 = {
    name                     = "prodstgacct1212wq"
    resource_group_name      = "rg-prod-1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    tags = {
      Owner       = "prodOps Team"
      Environment = "prod"
      Project     = "infrastructure deployment"
    }

  }
  stg2 = {
    name                     = "prodstgacct2121qw"
    resource_group_name      = "rg-prod-2"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Owner       = "prodOps Team"
      Environment = "prod"
      Project     = "infrastructure deployment"
    }

  }
}

vnets = {
  vnet1 = {
    vnet_name           = "prod-vnet-1"
    address_space       = ["192.168.0.0/24"]
    location            = "centralindia"
    resource_group_name = "rg-prod-1"
    tags = {
      Owner       = "prodOps Team"
      Environment = "prod"
      Project     = "infrastructure deployment"
    }
    subnets = {
      subnet1 = {
        name           = "prod-subnet-1"
        address_prefix = ["192.168.0.0/27"]
      }
    }
  }
  vnet2 = {
    vnet_name           = "prod-vnet-2"
    address_space       = ["192.168.0.0/25"]
    location            = "centralindia"
    resource_group_name = "rg-prod-2"
    tags = {
      Owner       = "prodOps Team"
      Environment = "prod"
      Project     = "infrastructure deployment"
    }
    # subnets = {
    #   subnet2 = {
    #   name           = "prod-subnet-2"
    #   address_prefix = ["192.168.0.0/27"]
    #   }
    # }
  }
}
