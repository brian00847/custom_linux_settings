#!/usr/bin/python3

#import subprocess
from subprocess import Popen, PIPE, call

svndiffscript="/home/mdi/bhenkel/custom_linux_settings/svndiff.sh"

def get_svn_files():
    svn_files = { 'unversioned': [], 
                  'modified': [],
                }
    args = ['svn', 'status']
    p = Popen(args, stdout=PIPE)
    p.wait()
    for l1 in p.stdout.readlines():
        l2 = l1.decode("utf-8").strip()
        if l2.startswith('M'):
            fname = l2.split()[1]
            svn_files['modified'].append(fname)
        elif l2.startswith('?'):
            fname = l2.split()[1]
            svn_files['unversioned'].append(fname)
    return svn_files

def to_int(sval):
    ret = None
    try:
        ret = int(sval)
    except ValueError as e:
        ret = None
    return ret

def print_modified_menu(modified_files):
    print("==============================")
    print("==== Modified Files ==========")
    print("==============================")
    i = 0
    for m in modified_files:
        print('%d: %s' % (i, m))
        i += 1

def make_selection(modified_files):
    while 1:
        print_modified_menu(modified_files)
        selection = input("Make a selection or 'q' to quit: ")
        print("User selected %s" % selection)
        if selection == 'q':
            print("Quitting...")
            break

        index = to_int(selection)
        if index != None and index < len(modified_files):
            fname = modified_files[index]
            print("User selected file: %s" % fname)
            args = ['svn', 'diff',  '--diff-cmd=%s' % svndiffscript, fname]
            call(args)
        else:
            print("Invalid selection")

def main():
    svn_files = get_svn_files()
    make_selection(svn_files['modified'])

if __name__ == '__main__':
    main()



