#!/bin/bash


#       Install Clang
echo -e "\n\n\tInstall Clang\n"
sudo apt install -y clang llvm-dev git libclang-dev
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++


cd ~
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
sudo apt install -y python3-distutils
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lldb;compiler-rt;lld;polly;debuginfo-tests;llvm" -DCMAKE_BUILD_TYPE=Release ../llvm
cmake --build . -j 8
sudo make install

sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/local/bin/clang++ 40
sudo update-alternatives --install /usr/bin/clang clang /usr/local/bin/clang 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/local/bin/clang++ 40
sudo update-alternatives --install /usr/bin/c++ c++ /usr/local/bin/clang++ 40
sudo update-alternatives --install /usr/bin/cxx cxx /usr/local/bin/clang++ 40
sudo update-alternatives --install /usr/bin/cc cc /usr/local/bin/clang++ 40


#       Install Include what you use
echo -e "\n\n\tInstall Include what you use\n"
sudo apt install -y iwyu
