# ===============================
# Terraform Azure Backend Setup
# ===============================

# Variables
$RESOURCE_GROUP = "dev-tfstate-rg"
$LOCATION       = "centralindia"
$STORAGE_ACCOUNT = "devtfstatebackend09876"   # must be globally unique
$CONTAINER      = "tfstate"

# Login (safe to re-run)
az account show 1>$null 2>$null
if ($LASTEXITCODE -ne 0) {
    az login
}

Write-Host "Creating Resource Group..."
az group create `
  --name $RESOURCE_GROUP `
  --location $LOCATION

Write-Host "Creating Storage Account..."
az storage account create `
  --name $STORAGE_ACCOUNT `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --sku Standard_LRS `
  --kind StorageV2

Write-Host "Creating Blob Container..."
az storage container create `
  --name $CONTAINER `
  --account-name $STORAGE_ACCOUNT

Write-Host "Terraform backend created successfully ✅"
