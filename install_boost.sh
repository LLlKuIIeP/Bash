  
#!/bin/bash


#       Install Boost
echo -e "\n\n\tInstall Boost\n"
cd ~
git clone https://github.com/boostorg/boost.git
cd boost
git submodule init
git submodule update
bash ./bootstrap.sh

sudo mkdir /opt/boost
sudo chmod a+rwx /opt/boost

./b2 install --prefix=/opt/boost
