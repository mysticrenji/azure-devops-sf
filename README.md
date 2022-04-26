# Terraform Azure Service Fabric Managed Cluster

## Pre-requisites

Before executing any one of the Terraform commands we need to complete the pre-requisites
### 1. First you need to install Azure CLI on your machine and set the subscription
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
// Get the subscription ID registered
az login
az account list --query [*].[name,id]
```

### 2. Create Service Principal to have programmatic access to ARM
```
// Copy the Output after SP Creation and save it
az ad sp create-for-rbac
--role="Contributor"
--scopes="/subscriptions/<$subscriptionid>"
```

### 3. Create Terraform Blob Storage to store state file
There is a script in the repo named ```backend-storage.sh``` to create the azure storage account and container. Please dont forget to change the values in the script, according to your needs.
```
RESOURCE_GROUP_NAME=""
STORAGE_ACCOUNT_NAME=terraformblobstoragedev
CONTAINER_NAME=tfstate
LOCATION=westus2
```
### 4. Exporting environment variables of SP for ARM authentication
Export the SP credentials that you created in the previous step (2) into shell, so that Terraform automatically reads the Environment variables and use it authenticate with Azure Resource Manager (ARM)
```
export ARM_CLIENT_ID=
export ARM_SUBSCRIPTION_ID=
export ARM_TENANT_ID=
export ARM_CLIENT_SECRET=

```

## Terraform Execution
Execute the Terraform commands in below order
```
terraform init
terraform fmt
terraform plan -var-file=staging.tfvars
terraform apply -var-file=staging.tfvars
```