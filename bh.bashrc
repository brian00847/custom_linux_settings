# .bashrc

# User specific aliases and functions

set -o vi

export PATH=${HOME}/vim-8.x/bin/:${PATH}
export PATH=${HOME}/tmux-2.x/bin/:${PATH}

export TERM="screen-256color"

alias svndiff='svn diff --diff-cmd=svndiff.sh'

alias imagej='java -jar ${HOME}/imagej/source/ij.jar -ijpath ${HOME}/imagej/source/'

alias ll='ls -ltr --color=auto --file-type'
alias ls='ls --color=auto --file-type'

## CScope
#Put the cursor over a C symbol that is used in several places in your program. Type "CTRL-\ s" (Control-backslash, then just 's') in quick succession, and you should see a menu at the bottom of your Vim window showing you all the uses of the symbol in the program. Select one of them and hit enter, and you'll jump to that use. As with ctags, you can hit "CTRL-t" to jump back to your original location before the search (and you can nest searches and CTRL-t will unwind them one at a time).
#Mnemonic: the '\' key is right next to the ']' key, which is used for ctags searches.

#Try the same search, but this time via "CTRL-spacebar s". This time, your Vim window will split in two horizontally , and the Cscope search result will be put in the new window. [if you've never used multiple Vim windows before: move between windows via 'CTRL-W w' (or CTRL-W arrow key, or CTRL-W h/j/k/l for left/up/down/right), close a window via 'CTRL-W c' (or good old ':q'), make the current window the only one via 'CTRL-W o', split a window into two via 'CTRL-W s' (or 'CTRL-W v' for a vertical split), open a file in a new window via ':spl[it] filename']
#Mnemonic: there's now a big, spacebar-like bar across the middle of your screen separating your Vim windows.

#(CTRL-\ s): list uses of symbol
#(CTRL-t): unwind search

#"CTRL-spacebar s": List uses of symbol, SPLIT window horizontally
function mcscope()
{
    rm -f cscope.*
#Why Cscope over Ctags:  https://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other
    find . -iname '*.[CH]' \
        -o -name '*.cpp' \
        -o -name '*.cc' \
        -o -name '*.hpp'  \
        -o -name '*.cu'  \
        > cscope.cpp.files

    cp cscope.cpp.files cscope.files

    find . -name '*.py' >> cscope.files

# -b: just build
# -q: create inverted index
        cscope -b -q
}

function mcscope_git()
{
    rm -f cscope.*
#Why Cscope over Ctags:  https://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other

    git_files=$(git ls-files)

    ls ${git_files}  | grep -e "\.cpp$"   \
                            -e "\.hpp$"   \
                            -e "\.h$"     \
                            -e "\.[CH]$"  \
                            -e "\.cpp$"   \
                            -e "\.cc$"    \
                            -e "\.hpp$"   \
                            -e "\.cu$"    \
        > cscope.cpp.files

    ls ${git_files}  | grep -e "\.py$"   \
        > cscope.py.files

    cat cscope.py.files cscope.cpp.files > cscope.files

# -b: just build
# -q: create inverted index
    cscope -b -q
}

function gitdiff()
{
    gitfile=$1
    if [ -e $gitfile ]; then
        git difftool -t vimdiff -y $gitfile
    else
        echo "File does not exist: $gitfile"
    fi
}

function jsonlint()
{
    json_file=$1
    python -m json.tool ${json_file}
}

