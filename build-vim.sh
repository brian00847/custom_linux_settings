#!/bin/bash

#Enable copying to clipboard with these rpm packages:
#install these rpms libX11-devel libXtst-devel libXt-devel libSM-devel libXpm-devel

set -e

zip_file=$(realpath zips/vim-master.zip)

if [ ! -f $zip_file ];then
    echo "Missing zip file!: $zip_file"
fi

extract_dir=$(mktemp -d)
pushd ${extract_dir}

unzip $zip_file

cd vim-master 

rm -f src/auto/config.cache
CFLAGS="${CFLAGS} -fPIC -O3" ./configure --prefix=${HOME}/vim-8.x/ --enable-rubyinterp=yes 
make -j4
echo "Current directory is $(pwd)"

popd
rm -rf $extract_dir
