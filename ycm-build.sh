#!/bin/bash

#YouCompleteMe configure and build steps


export EXTRA_CMAKE_ARGS="-DEXTERNAL_LIBCLANG_PATH=/work/git/llvm-project/llvm/root/lib/libclang.so" 
python3 ./install.py --clang-completer
