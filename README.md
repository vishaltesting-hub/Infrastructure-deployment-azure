☁️ Azure Infra Deployment 🚀

Welcome to azure-infra-deployment — a fully automated, modular Terraform project for provisioning and managing Azure Infrastructure with best practices in scalability, security, and maintainability. 💪

🧩 Overview

This project deploys a complete Azure environment that includes:

🏗️ Resource Group (RG)

🌐 Virtual Network (VNet) and Subnets

🖥️ Virtual Machines (VMs)

🧰 Storage Account (STG)

🔑 Azure Key Vault (Secrets Management)

🛡️ Azure Bastion Host (Secure VM Access)

⚖️ Load Balancer (Traffic Distribution)

All modules are designed with reusability and modularity in mind — making your Azure infra scalable and easy to maintain. 🧠

🧱 Project Structure
azure-infra-deployment/
│
├── main.tf                # Root module to call all other modules
├── providers.tf           # AzureRM provider configuration
├── variables.tf           # Input variables
├── outputs.tf             # Output values
├── terraform.tfvars       # Variable values (environment-specific)
│
├── modules/
│   ├── resource-group/    # Creates Azure Resource Group
│   ├── network/           # Creates VNet and Subnets
│   ├── storage/           # Creates Storage Account
│   ├── keyvault/          # Creates Azure Key Vault
│   ├── bastion/           # Creates Bastion Host
│   ├── loadbalancer/      # Creates Load Balancer
│   └── vm/                # Creates Virtual Machines
│
└── README.md              # Project documentation

⚙️ Prerequisites

Before running the deployment, ensure you have the following:

✅ Terraform
 ≥ 1.6
✅ Azure CLI
 configured
✅ Access to an Azure Subscription
✅ Proper Azure AD permissions (Contributor/Owner)

🚀 How to Deploy

Follow these simple steps 👇

# 1️⃣ Initialize Terraform
terraform init

# 2️⃣ Validate configuration
terraform validate

# 3️⃣ Preview infrastructure changes
terraform plan -out plan.tfplan

# 4️⃣ Apply and deploy infrastructure
terraform apply plan.tfplan


To destroy the infra 👇

terraform destroy -auto-approve

🔐 Security & Best Practices

🛡️ Sensitive data (like passwords, keys) are stored securely in Azure Key Vault.
🔒 Bastion Host provides RDP/SSH access without exposing public IPs.
🏗️ Modular design ensures scalability and reusability.
📜 State files can be stored in a Remote Backend (Azure Storage) for team collaboration.

🧠 Modules Overview
Module	Description	Key Resources
resource-group	Creates the RG	azurerm_resource_group
network	Creates VNet + Subnets	azurerm_virtual_network, azurerm_subnet
storage	Creates Storage Account	azurerm_storage_account
keyvault	Manages Secrets	azurerm_key_vault, azurerm_key_vault_secret
bastion	Secure Remote Access	azurerm_bastion_host
loadbalancer	Balances VM traffic	azurerm_lb, azurerm_lb_backend_address_pool
vm	Creates Windows/Linux VMs	azurerm_virtual_machine, azurerm_network_interface
📦 Remote Backend (Optional)

To enable state management across teams, configure a remote backend in backend.tf:

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

🧰 Example Usage

Example root module invocation:

module "rg" {
  source  = "./modules/resource-group"
  rg_name = "dev-rg"
  location = "East US"
}

module "vnet" {
  source              = "./modules/network"
  vnet_name           = "dev-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
  resource_group_name = module.rg.name
}

module "vm" {
  source              = "./modules/vm"
  vm_count            = 2
  vm_size             = "Standard_B2s"
  admin_username      = "azureadmin"
  subnet_id           = module.vnet.subnet_ids[0]
  resource_group_name = module.rg.name
}

🧾 Outputs

After successful deployment, Terraform will output:

🏗️ Resource Group name

🌐 Virtual Network name

🖥️ VM Private IPs

🔑 Key Vault URI

⚖️ Load Balancer Public IP

🤝 Contributing

Contributions are always welcome! 💬

Fork the repo 🍴

Create a new branch 🌿

Make your changes 💻

Submit a PR 🚀

📜 License

This project is licensed under the MIT License.

💡 Author

👨‍💻 Vishal Pandey
☁️ DevOps Engineer | Infrastructure as Code Enthusiast
🔗 LinkedIn
 | GitHub
