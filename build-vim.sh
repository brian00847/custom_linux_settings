#!/bin/bash

#Enable copying to clipboard with these rpm packages:
#install these rpms libX11-devel libXtst-devel libXt-devel libSM-devel libXpm-devel
#Install python2-devel and python3-devel
#For GVIM gtk2-devel

#Note: Manually installing command-t didn't seem to work too well.
#Look into running vundle through command-line

#### You-Complete-Me 
#Install python headers
#Compile
## cd ~/.vim/bundle/YouCompleteMe
## python3 install.py --clang-completer


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
VIMPYFLAGS="--enable-pythoninterp=yes   --with-python-config-dir=/usr/lib64/python2.7/config/"
VIMPY3FLAGS="--enable-python3interp=yes --with-python3-config-dir=/usr/lib64/python3.6/config/"
GUI_FLAGS="--enable-gui=gtk2 --enable-gnome-check --with-x" #This works!! with gtk2-devel installed
CFLAGS="${CFLAGS} -fPIC -O3" ./configure --prefix=${HOME}/vim-8.x/ --enable-rubyinterp=yes ${VIMPYFLAGS} ${VIMPY3FLAGS} ${GUI_FLAGS}
make -j4 install
echo "Current directory is $(pwd)"

popd

echo "Extract dir is: ${extract_dir}"
rm -rf $extract_dir
