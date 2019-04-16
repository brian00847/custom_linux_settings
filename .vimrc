set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'Valloric/YouCompleteMe'
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


colorscheme gruvbox
set background=dark    " Setting dark mode for gruvbox

set hidden          " Do not require buffer to be saved when switching buffers
set nostartofline   " Do not move cursor to beginning of line when switching buffers


"colorscheme darkblue
set shiftwidth=4
set sta
set sr
set si
set expandtab

set mouse=a               " Enable Mouse

set number                " Show Line Numbers
set relativenumber        " Show Relative Line Numbers

set wildmode=longest,list " Finding a file

set ruler                 " show the cursor position all the time

set so=5                  " show 3 lines between the cursor and the screen edge

set noea                  " turn off window size equalizing

set hlsearch

set showtabline=2         " Always show tab filename

set backspace=2           " Makes backspace work again after pressing 'a' or 'A'

" Disable annoying auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""
"   Key Mappings                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""
"F2 - Insert 'cout' Statement
map #2 Ostd::cout << " << std::endl;<Esc>F"a

"F3 - Clear Highlighted Search
map #3 /ClearHighlightedSearchPattern:

"F4 - Clear Buffer
map #4 :e:0mdGd'd

"F5 - Show Markings for Makefile
map #5 :set noexpandtab:set list

" Note: To create a ^M (Enter Key) - press Ctrl+V then press enter

" map <C-S-PageDown> :tabnext<CR>
" map <C-S-PageUp> :tabprev<CR>

"set cursorcolumn

nnoremap E $
nnoremap K $

" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>


syntax on

set rtp+=~/.vim/bundle/Vundle.vim
set tags=tags;     " look in parent directories for ctags file named 'tags'

