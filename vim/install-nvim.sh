#!/bin/bash

# April 3, 2025

# This script is to install plugins for neovim. 
# - pyright
#   - Autocomplete for python
# - command_t
#       - I had issues installing command-t with lazy. the require(wincent.commandt) doesn't find the commandt.so file that was built with make. 
#       - Steps:
#       -   git clone into pack/start directory
#       -   run make

# TODO: Add these steps to ansible



function install_deps() { 
if [ ! $(whoami) == "root" ]; then
    echo "I am not root. exiting"
    exit 1
fi
apt install nodejs npm
pkgs="nodejs npm cmake ruby-dev"

apt install $pkgs
npm install -g pyright
}

function query_pyright() { 
npm list -g --depth=0
}


#install_deps

query_pyright

function install_command_t() { 

command_t_src=${HOME}/.local/share/nvim/site/pack/command-t/start
command_t_build_dir=${command_t_src}/command-t/lua/wincent/commandt/lib/

mkdir -p ${command_t_src}
cd ${command_t_src}

#git clone --depth 1 https://github.com/wincent/command-t.git

cd ${command_t_build_dir} 
echo "## Running make in ${command_t_build_dir}"
make


}

install_command_t
#ansible-playbook -i ../hosts nvim-install.yml

# abc123

