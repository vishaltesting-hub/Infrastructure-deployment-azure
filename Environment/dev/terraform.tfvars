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
}

vms = {
  vm1 = {
    nic_name    = "dev-nic-1"
    vm_name     = "dev-vm-1"
    rg_name     = "rg-dev-1"
    location    = "centralindia"
    vm_size     = "Standard_B1s"
    custom_data = filebase64("${path.module}/ngnix.sh")
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }
    disable_password_authentication = "false"
    os_disk_caching                 = "ReadWrite"
    os_disk_storage_account_type    = "Standard_LRS"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
    }
    subnet_name    = "dev-subnet-1"
    vnet_name      = "dev-vnet-1"
    public_ip_name = "dev-public-ip-1"
    kv_name        = "dev-kv-1"
  }
}

kvs = {
  "kv_name" = {
    name                = "dev-kv-1"
    resource_group_name = "rg-dev-1"
    location            = "centralindia"
    sku_name            = "standard"
    tags = {
      Owner       = "DevOps Team"
      Environment = "Dev"
      Project     = "infrastructure deployment"
    }
    secrets = {
      secret1= {
        name  = "vm_username"
        value = "dev-vm-user"
      }
      secret2= {
        name  = "vm_password"
        value = "P@ssword1234"
    }
  }
  }

} 