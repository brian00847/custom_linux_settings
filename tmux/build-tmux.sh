#!/bin/bash

#yum dependencies:
#libevent-devel
set -e

zip_filename=tmux-master.zip

zip_file=$(realpath zips/${zip_filename})

if [ ! -f $zip_file ];then
    echo "Missing zip file!: $zip_file"
fi

extract_dir=$(mktemp -d)
pushd ${extract_dir}

unzip $zip_file

cd tmux-master 


echo "Current directory is $(pwd)"
sh autogen.sh
./configure --prefix=${HOME}/tmux-2.x/
make install

popd

echo "Extract dir is: ${extract_dir}"
rm -rf $extract_dir

