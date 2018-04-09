## Challenge 3
# Register service providers for az shell
az provider register -n Microsoft.Network
az provider register -n Microsoft.Storage
az provider register -n Microsoft.Compute
az provider register -n Microsoft.ContainerService

# Crate AKS cluster 
az group create --name LinuxConfEastUS --location eastus
az aks create --resource-group LinuxConfEastUS --name MinecraftClass --node-count 1 --generate-ssh-keys

# Install CLI extentions
az aks install-cli

# Login to the cluster
az aks get-credentials --resource-group LinuxConfEastUS --name MinecraftClass

# Show availible nodes
kubectl get nodes

# Start deployment
kubectl create -f deployment.yaml
# Check deployment status
kubectl get deployments
kubectl get pods
kubectl get services
