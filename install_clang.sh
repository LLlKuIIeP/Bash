#!/bin/bash


#       Install Clang
echo -e "\n\n\tInstall Clang\n"
cd ~
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
sudo apt install -y python3-distutils
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lldb;compiler-rt;lld;polly;debuginfo-tests;llvm" -DCMAKE_BUILD_TYPE=Release ../llvm
cmake --build . -j 8
sudo make install


#       Install Include what you use
echo -e "\n\n\tInstall Include what you use\n"
sudo apt install -y iwyu
