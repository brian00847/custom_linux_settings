#!/bin/bash

#This is part of the process to build YouCompleteMe for vim
#This script contains the commands necessary to build llvm. 
#Instructions copied from https://github.com/ycm-core/YouCompleteMe/wiki/Full-installation-on-CentOS
#exit 1
source /opt/rh/devtoolset-8/enable

cmake3 -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`pwd`/../root ../

make -j8 # wait another lifetime
make install

#pushd 
