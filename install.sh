#!/bin/bash


#function link
#{
#    arg_file=${1}
#    bak_file=${arg_file}.bak
#    pushd ~/
#    if [ -f ${arg_file} -a ! -h ${arg_file} ]; then
#        echo "Moving ${arg_file} to ${bak_file}"
#        mv ${arg_file} ${bak_file}
#    fi
#    popd
#    echo "Creating symlink in home directory for $(pwd)/${arg_file}"
#    ln -sf $(pwd)/${arg_file} ~/
#}


#link .vimrc
#link .tmux.conf
#link .bashrc

ansible-playbook myplaybook.yml

