set nocompatible              " be iMproved, required
filetype off                  " required
set ttymouse=xterm2           " Allows vim windows to be resized with mouse in tmux


"YouCompleteMe Configs
set signcolumn=yes
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_always_populate_location_list = 1 "Supposed to put errors in QuickFix window, but it's not working :-/

"CTags Config
set tags=tags;     " look in parent directories for ctags file named 'tags'

"GruvBox Configs
colorscheme gruvbox
set background=dark    " Setting dark mode for gruvbox

set hidden          " Do not require buffer to be saved when switching buffers
set nostartofline   " Do not move cursor to beginning of line when switching buffers


"colorscheme darkblue

"Personal Preferences
set shiftwidth=4
set sta
set sr
set si
set expandtab             "Tab key inserts spaces

set mouse=a               " Enable Mouse

set number                " Show Line Numbers
set relativenumber        " Show Relative Line Numbers

set wildmode=longest,list " Finding a file

set ruler                 " show the cursor position all the time

set so=5                  " show 3 lines between the cursor and the screen edge

set noea                  " turn off window size equalizing

set hlsearch

"set showtabline=2         " Always show tab filename

set backspace=2           " Makes backspace work again after pressing 'a' or 'A'

" Disable annoying auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Disable Arrow Keys. For training purposes only
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

nnoremap E $
nnoremap K $

syntax on

"Ignore build files from command-t listing
set wildignore+=*.o,*.obj,.git,*/CMakeFiles/*,*.pyc

" Command-T
" - Refresh file list
" Use <C-f> (that's control-f), when CommandT is open.


"     Vim folding commands
" ---------------------------------
" == Open/Close Folds
" zo opens a fold at the cursor.
" zO opens ALL folds at the cursor.
" zc closes a fold under cursor. 

" zM closes all open folds.
" zR decreases the foldlevel to zero -- all folds will be open.

" == Fold Navigation
" zj moves the cursor to the next fold.
" zk moves the cursor to the previous fold.

" zf#j creates a fold from the cursor down # lines.
" zf/ string creates a fold from the cursor to string .
" za toggle a fold at the cursor.

" == Other Fold Commands
" zm increases the foldlevel by one.
" zr decreases the foldlevel by one.
" zd deletes the fold at the cursor.
" zE deletes all folds.

" [z move to start of open fold.
" ]z move to end of open fold.

" Folding on Syntax
set foldmethod=syntax

"Open all folds on default when loading a file
set foldlevelstart=20

" Folding on indent
" set foldmethod=indent
" set foldlevel=1
" set foldclose=all

"Allow vim to call bash bunctions
set shell=/bin/bash\ -i

"Reload cscope database with F5. 'mcscope' is a bash function
map <F5> :!mcscope <CR>:cs reset<CR><CR>   
