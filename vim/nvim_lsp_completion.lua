


-- Installing LSP + nvim-cmp for autocompletion
--      -Install lazy.nvim
--      -Install pyright language server.
--      -Use lazy.nvim to install 'nvim-cmp'

-- Set runtime path for lazy.nvim
vim.opt.rtp:prepend("{{ lazy_nvim_dir }}")

-- Ensure lazy.nvim is properly loaded.  Note: had to manually add this path
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then
  print("Error: lazy.nvim not found at " .. lazypath)
else
  vim.opt.rtp:prepend(lazypath)
end



-- Setup lazy.nvim plugins
require("lazy").setup({
    { "neovim/nvim-lspconfig" },    -- LSP support
    { "hrsh7th/nvim-cmp" },         -- Autocompletion
    { "hrsh7th/cmp-nvim-lsp" },     -- LSP source for completion
    { "hrsh7th/cmp-buffer" },       -- Buffer completion
    { "hrsh7th/cmp-path" },         -- Path completion
    { "hrsh7th/cmp-cmdline" },      -- Command-line completion
    { "L3MON4D3/LuaSnip" },         -- Snippets engine
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } -- Syntax highlighting
})

-- LSP and nvim-cmp setup
local lspconfig = require('lspconfig')
local cmp = require('cmp')

lspconfig.pyright.setup{}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
    })
})

vim.opt.signcolumn = "yes"

