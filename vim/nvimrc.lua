-- Neovim init file
    -- ========= Begin File ${HOME}/.config/nvim/init.lua ==========
    -- dofile('/path/to/this/file')
    -- ========= End   File ${HOME}/.config/nvim/init.lua ==========


require('wincent.commandt').setup()

vim.keymap.set('n', '<Leader>b', '<Plug>(CommandTBuffer)')
vim.keymap.set('n', '<Leader>j', '<Plug>(CommandTJump)')
vim.keymap.set('n', '<Leader>t', '<Plug>(CommandT)')

-- Comment example

-- Source vimrc file with vimscript
vim.cmd('source /home/bh/.vimrc')

