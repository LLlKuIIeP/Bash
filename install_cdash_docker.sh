#!/bin/bash


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
