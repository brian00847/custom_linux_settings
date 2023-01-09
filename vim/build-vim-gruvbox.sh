#!/bin/bash

#Enable copying to clipboard with these rpm packages:
#install these rpms libX11-devel libXtst-devel libXt-devel libSM-devel libXpm-devel

set -e

zip_file=$(realpath zips/gruvbox-master.zip)

if [ ! -f $zip_file ];then
    echo "Missing zip file!: $zip_file"
fi

tmpdir=$(mktemp -d)
src_dir=${HOME}/.vim/bundle/gruvbox/ 

unzip $zip_file -d $tmpdir

rm -rf ${src_dir}
mv ${tmpdir}/gruvbox-master ${src_dir}
ls ${src_dir}

rm -rf ${tmpdir}

