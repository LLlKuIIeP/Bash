#!/bin/bash


#       Install Docker
echo -e "\n\n\tInstall Docker\n"
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version


#       Install Docker Compose
echo -e "\n\n\tInstall docker-ompose\n"
sudo apt-get update
sudo apt-get remove docker-compose
sudo apt-get install -y jq
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod +x $DESTINATION
docker-compose --version
