## Challange 4
### Does not work for the new cluster version 
# Creating Azure Storage Accounts
az storage account create -n minecraftlinconfstor --sku Standard_LRS

# Getting connection string
az storage account show-connection-string -n minecraftlinconfstor -o tsv
export AZURE_STORAGE_CONNECTION_STRING=`az storage account show-connection-string -n minecraftlinconfstor -o tsv`

# Ger Storage Key
az storage account keys list --account-name minecraftlinconfstor --query "[0].value" -o tsv
export STORAGE_KEY=`az storage account keys list --account-name minecraftlinconfstor --query "[0].value" -o tsv`
export AKS_PERS_STORAGE_ACCOUNT_NAME=minecraftlinconfstor

# Create storage credentials for storage account
kubectl create secret generic azure-secret --from-literal=azurestorageaccountname=$AKS_PERS_STORAGE_ACCOUNT_NAME --from-literal=azurestorageaccountkey=$STORAGE_KEY
###

### Updated for Storage Volume:
az group list --output table
az storage account create --resource-group MC_LinuxConfEastUS_MinecraftClass_eastus --name linconfstorage1 --location eastus --sku Standard_LRS
kubectl create -f storage-class.yaml
kubectl create -f storage-pvc.yaml
kubectl apply -f deploymant.yaml