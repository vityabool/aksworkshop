## Challange 1

docker pull openhack/minecraft-server
docker run -d -p 25565:25565 -e EULA=TRUE openhack/minecraft-server