  
#!/bin/bash


#       Install Boost
echo -e "\n\n\tInstall Boost\n"
#cd ~
#git clone https://github.com/boostorg/boost.git
#cd boost
#git submodule init
#git submodule update

#cd /home/user/boost
#chmod +x tools/build/src/engine/build.sh

cd /tmp/boost
bash ./bootstrap.sh

#mkdir /opt/boost
#chmod a+rw /opt/boost
# sudo ./b2 cxxflags=-fPIC -a install
./b2 install


#     Env
#sh -c "echo 'BOOST_ROOT=\"/opt/boost\"' >> /etc/environment"
#sh -c "echo 'BOOST_LIBRARYDIR=\"/opt/boost/lib\"' >> /etc/environment"
#sh -c "echo 'BOOST_INCLUDEDIR=\"/opt/boost/include\"' >> /etc/environment"

#source /etc/environment
