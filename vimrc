set nocompatible              " be iMproved, required
filetype off                  " required

"YouCompleteMe Configs
set signcolumn=yes
let g:ycm_autoclose_preview_window_after_completion = 0

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
set wildignore+=*.o,*.obj,.git,*/CMakeFiles/*


