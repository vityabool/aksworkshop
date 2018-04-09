
### Challange #2
az login
az configure –defaults location=westus group=LinuxConf
az group create -l westus -n LinuxConf
az container create --name minecraft --image openhack/minecraft-server --dns-name-label minecraft-dns \
   --cpu 1 --memory 2 --ip-address public --ports 25565 -e EULA=TRUE

### Challnge #2.1 (Optional)
# Crate Azure container registry
az acr crate --name contRep --sku Basic
az acr login --name contRep

# Crate login/password. Login is the same as registry name. !Not the best solution - just for demo 
az acr update --name contrep --admin-enabled true
az acr credential show --name contrep --query "passwords[0].value"

# Get repository name
az acr list --resource-group LinuxConf --query "[].{acrLoginServer:loginServer}" --output table
# Tag and push new container into the new repository
docker tag friendlyhello contrep.azurecr.io/friendlyhello:v1
docker push contrep.azurecr.io/friendlyhello:v1

# Check new container exist there:
az acr repository list --name contrep --output table 
az container create --name friendlyhello --image contrep.azurecr.io/friendlyhello:v1 \
--ip-address public --ports 4000

# Check deployment status, look at logs:
az container list
az container attach --name friendlyhello
