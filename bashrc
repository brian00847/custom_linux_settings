# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

set -o vi

export PATH=${HOME}/vim-8.x/bin/:${PATH}
export PATH=${HOME}/tmux-2.x/bin/:${PATH}

export TERM="screen-256color"

alias svndiff='svn diff --diff-cmd=svndiff.sh'

alias imagej='java -jar ${HOME}/imagej/source/ij.jar -ijpath ${HOME}/imagej/source/'

