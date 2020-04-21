#!/bin/bash


#       Install Docker
echo -e "\n\n\tInstall Docker\n"
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version


#       Install Docker Compose
echo -e "\n\n\tInstall docker-ompose\n"
sudo apt-get update
sudo apt-get remove docker-compose
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod +x $DESTINATION
docker-compose --version


#       Install NodeJs
echo -r "\n\n\tInstall NodeJs\n"
sudo apt-get update
cd ~/
VERSION=v12.16.2
DISTRO=linux-x64
wget https://nodejs.org/download/release/$VERSION/node-$VERSION-$DISTRO.tar.xz
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
source .profile
node -v
npm  version
npx -v


#       Run Docker
sudo apt-get update
cd ~/
git clone https://github.com/Kitware/CDash.git
cd CDash
sudo docker-compose up -d
