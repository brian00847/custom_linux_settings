#!/bin/bash



function create_git_files()
{

#Header files
files_h=git-files-h.txt
#cpp files
files_c=git-files-c.txt
#header and source files
files_src=git-files-h-c.txt
#python files
files_py=git-files-py.txt

files_all=git_files-all.txt

git ls-files > $files_all

grep -e "\.hpp$" \
     -e "\.[Hh]$" \
        -i $files_all | sort > $files_h

grep -e "\.cpp$" \
     -e "\.[Cc]$" \
     -e "\.cu$" \
        -i $files_all | sort > $files_c

grep -e "\.py$" \
        -i $files_all | sort > $files_py

cat ${files_h} ${files_c} > ${files_src}

wc -l $files_c
wc -l $files_h
wc -l $files_src
wc -l $files_py
wc -l $files_all

#Create cscope files
#Run cscope
echo "Building CScope Database..."
#cp $files_all cscope.files
cp $files_src cscope.files
time cscope -b -q
echo "Building CScope Database...done"
}


