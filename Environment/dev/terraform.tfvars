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
    name                     = "devstgacct1212p"
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
    name                     = "devstgacct2121d"
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
}

vms = {
  vm1 = {
    nic_name = "dev-nic-1"
    vm_name  = "dev-vm-1"
    rg_name  = "rg-dev-1"
    location = "centralindia"
    vm_size  = "Standard_B1s"

    subnet_name    = "dev-subnet-1"
    vnet_name      = "dev-vnet-1"
    public_ip_name = "dev-public-ip-1"

    kv_name                 = "dev-kv-10"
    vm_username_secret_name = "vm-username"
    vm_password_secret_name = "vm-password"

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
    }

    tags = {
      Environment = "Dev"
    }
  }
}

public_ip = {
  dev-public-ip-1 = {
    name                = "dev-public-ip-1"
    resource_group_name = "rg-dev-1"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"

    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }
  }
}

kvs = {
  devkv = {
    name                = "dev-kv-10"
    resource_group_name = "rg-dev-1"
    location            = "centralindia"
    sku_name            = "standard"

    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }

    # simple map of secrets (key → { name, value })
    secrets = {
      vm_username = {
        name  = "vm1-username"
        value = "dev-vm-user"
      }

      vm_password = {
        name  = "vm1-password"
        value = "P@ssword1234"
      }
    }

  }
}
