#!/bin/bash

#yum dependencies:
#python-flake8 pytest pylint
#Does not need to be installed. Can be called with just 'python ranger.py'

set -e

zip_filename=ranger-master.zip

zip_file=$(realpath zips/${zip_filename})

if [ ! -f $zip_file ];then
    echo "Missing zip file!: $zip_file"
fi

#extract_dir=$(mktemp -d)
extract_dir=${HOME}/ranger/
mkdir -p ${extract_dir}

pushd ${extract_dir}

unzip $zip_file

cd ranger-master 


echo "Current directory is $(pwd)"
#make install DESTDIR=${HOME}/ranger-src/

popd

echo "Extract dir is: ${extract_dir}"
#rm -rf $extract_dir

