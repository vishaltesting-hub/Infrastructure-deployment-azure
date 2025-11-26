module "resource_group" {
  source         = "../../modules/azure_resource_group"
  resource_group = var.resource_group

}

module "storage_account" {
  source          = "../../modules/azure_storage_account"
  storage_account = var.storage_account
  depends_on      = [module.resource_group]
}

module "networks" {
  source     = "../../modules/azure_networks"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "compute" {
  source     = "../../modules/azure_compute"
  vms        = var.vms
  depends_on = [module.networks,module.key_vault, module.public_ip]
}

module "public_ip" {
  source     = "../../modules/azure_pip"
  public_ip  = var.public_ip
  depends_on = [module.resource_group]
}

#  The module at module.key_vault is a legacy module which contains its own local provider configurations, and so calls to it may not use
# │ the count, for_each, or depends_on arguments.

module "key_vault" {
  source = "../../modules/azure_key_vault"
  kvs    = var.kvs
  depends_on = [module.resource_group, ]
}
