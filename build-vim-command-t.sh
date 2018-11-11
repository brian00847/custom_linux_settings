#!/bin/bash

#Enable copying to clipboard with these rpm packages:
#install these rpms libX11-devel libXtst-devel libXt-devel libSM-devel libXpm-devel

set -e

zip_file=$(realpath zips/command-t-master.zip)

if [ ! -f $zip_file ];then
    echo "Missing zip file!: $zip_file"
fi

tmpdir=$(mktemp -d)
src_dir=${HOME}/.vim/bundle/command-t/ #FIXME: rename this variable
#pushd ${src_dir}

unzip $zip_file -d $tmpdir
rm -rf ${src_dir}
mv ${tmpdir}/command-t-master ${src_dir}
pushd ${src_dir}/ruby/command-t/ext/command-t
ruby extconf.rb
make
popd

rm -rf ${tmpdir}
