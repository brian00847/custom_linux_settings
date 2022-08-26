#!/bin/bash

#Cygwin: Had to install git via cygwin to get 'git difftool' to work properly

function set_configs()
{
git config --global diff.tool vimdiff
git config --global difftool.prompt false

git config diff.tool vimdiff
git config difftool.prompt false

git config --global difftool.vimdiff.cmd 'vim -f -d -c "wincmd l" -c '\''cd "$GIT_PREFIX"'\'' "$LOCAL" "$REMOTE"'

}


function get_configs()
{
    echo "Getting configs"
    #git config --get-all diff.tool
    #git config --get merge.tool
    git config --list
}

set_configs
get_configs
