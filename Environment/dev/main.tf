module "resource_group" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group

}

module "storage_account" {
  source          = "../../modules/storage_account"
  storage_account = var.storage_account
  depends_on      = [module.resource_group]
}

module "networks" {
  source     = "../../modules/networks"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}
