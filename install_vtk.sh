#!/bin/bash

apt install -y libxt-dev 

mkdir /home/user/vtk_build
cd /home/user/vtk_build

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=Release -DBUILD_SHARED_LIBS:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DBUILD_EXAMPLES:BOOL=OFF -DCMAKE_INSTALL_PREFIX:STRING=/usr/local ../vtk_sources

cmake --build . -j 8

make install
