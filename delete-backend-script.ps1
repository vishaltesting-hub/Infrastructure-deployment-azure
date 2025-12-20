# ===============================
# Terraform Backend Cleanup
# ===============================

# -------- VARIABLES --------
$RESOURCE_GROUP  = "dev-tfstate-rg"
$STORAGE_ACCOUNT = "devtfstatebackend09876"

# Azure DevOps Service Connection (Client ID)
# $SP_APP_ID       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# $ROLE_NAME       = "Storage Blob Data Contributor"
# ---------------------------

Write-Host "Checking Azure login..."
az account show 1>$null 2>$null
if ($LASTEXITCODE -ne 0) {
    az login
}

# Get storage account scope
$STORAGE_SCOPE = az storage account show `
  --name $STORAGE_ACCOUNT `
  --resource-group $RESOURCE_GROUP `
  --query id -o tsv 2>$null

if ($STORAGE_SCOPE) {
    Write-Host "Removing RBAC assignment..."
    az role assignment delete `
      --assignee $SP_APP_ID `
      --role "$ROLE_NAME" `
      --scope $STORAGE_SCOPE
} else {
    Write-Host "Storage account already deleted or not found"
}

# Delete Resource Group (removes storage + container automatically)
Write-Host "Deleting Resource Group..."
az group delete `
  --name $RESOURCE_GROUP `
  --yes `
  --no-wait

Write-Host "Terraform backend cleanup initiated ✅"
