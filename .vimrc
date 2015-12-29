set shiftwidth=4
set sta
set sr
set si
set expandtab

set mouse=a               " Enable Mouse

set number                " Show Line Numbers

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
