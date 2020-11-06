#!/bin/bash

mkdir /tmp/vtk_build

cmake -S /tmp/vtk_sources -B /tmp/vtk_build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=Release -DBUILD_SHARED_LIBS:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DBUILD_EXAMPLES:BOOL=OFF -DCMAKE_INSTALL_PREFIX:STRING=/usr/local -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON

cmake --build /tmp/vtk_build -j 8

cd /tmp/vtk_build

make install
