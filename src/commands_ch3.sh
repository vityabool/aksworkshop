## Challenge 3
# Register service providers for az shell
az provider register -n Microsoft.Network
az provider register -n Microsoft.Storage
az provider register -n Microsoft.Compute
az provider register -n Microsoft.ContainerService

# Crate AKS cluster 
az group create --name AKSDemoA --location westeurope
az aks create --resource-group AKSDemoA --name MinecraftAKK --node-count 1 --generate-ssh-keys

# Install CLI extensions
az aks install-cli

# Login to the cluster
az aks get-credentials --resource-group AKSDemoA --name MinecraftAKK

# Show available nodes
kubectl get nodes

# Start deployment
kubectl create -f deployment.yaml

# Check deployment status
kubectl get deployments
kubectl get pods
kubectl get services

# Delete cluster after
az aks delete --resource-group AKSDemoA --name MinecraftAKK
az group delete AKSDemoA