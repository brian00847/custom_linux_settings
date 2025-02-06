-- Neovim init file
    -- ========= Begin File ${HOME}/.config/nvim/init.lua ==========
    -- dofile('/path/to/this/file')
    -- ========= End   File ${HOME}/.config/nvim/init.lua ==========


require('wincent.commandt').setup()

vim.keymap.set('n', '<Leader>b', '<Plug>(CommandTBuffer)')
vim.keymap.set('n', '<Leader>j', '<Plug>(CommandTJump)')
vim.keymap.set('n', '<Leader>t', '<Plug>(CommandTGit)')


-- lazy.nvim takes over the runtime path. Manualy adding plugins that were obtained via git clone.
-- Not sure how to make this work. I'm wondering if lazy.nvim is clobbering the run path. Look into this later
-- vim.opt.rtp:append('/home/bh/.local/share/nvim/site/pack/gruvbox/start')
-- vim.opt.rtp:append('/home/bh/.local/share/nvim/site/pack/vim-illuminate/start')
-- vim.opt.rtp:append('/home/bh/.local/share/nvim/site/pack/vim-fugitive/start')
-- vim.opt.rtp:append('/home/bh/.local/share/nvim/site/pack/command-t/start')
-- vim.opt.rtp:append('/home/bh/.local/share/nvim/site/pack/airline/start')


-- Source vimrc file with vimscript
vim.cmd('source /home/bh/.vimrc')


dofile('/home/bh/git/custom_linux_settings/vim/nvim_lsp_completion.lua')


