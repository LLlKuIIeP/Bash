#!/bin/bash


#       Install Docker
echo -e "\n\n\tInstall Docker\n"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl  gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version


#       Install Docker Compose
echo -e "\n\n\tInstall docker-ompose\n"
sudo apt update
sudo apt remove docker-compose
sudo apt install -y jq
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod +x $DESTINATION
docker-compose --version
