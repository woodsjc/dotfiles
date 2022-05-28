local opt = vim.opt

vim.cmd([[set nocompatible]])
vim.cmd([[filetype plugin indent on]])
opt.syntax.enable = true

--need with termguicolors
--vim.cmd([[t_8f = "\\<Esc>[38:2:%lu:%lu:%lum"]])
--vim.cmd([[t_8b = "\\<Esc>[48:2:%lu:%lu:%lum"]])

opt.autowrite = true
opt.cmdheight=2
opt.colorcolumn="80"
opt.completeopt="menuone,noselect"
opt.cursorline=true
opt.expandtab=true
opt.hidden=true
opt.ignorecase=true
opt.incsearch=true
vim.cmd([[set nobackup]])
vim.cmd([[set noerrorbells]])
vim.cmd([[set nohlsearch]])
vim.cmd([[set noshowmode]])
vim.cmd([[set noswapfile]])
vim.cmd([[set nowrap]])
vim.cmd([[set nolazyredraw]])
opt.number=true
opt.scrolloff=8
opt.signcolumn="yes"
opt.shortmess.c=true
opt.showmatch=true
opt.showmode=true
opt.shiftwidth=4
--opt.t_Co=256
opt.tabstop=4
opt.termguicolors=true
opt.smartcase=true
opt.updatetime=100
opt.undodir=os.getenv("HOME").."/.vim/undodir"
opt.undofile=true

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'flazz/vim-colorschemes'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

    Plug 'glepnir/lspsaga.nvim'
    Plug 'rust-lang/rust.vim'
    Plug 'simrat39/rust-tools.nvim'
vim.call('plug#end')

vim.cmd([[colorscheme seattle]])

vim.g.ftplugin_sql_omni_key = '<C-P>q'

vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', {noremap=true})
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',  {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>',    {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',  {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>bd<cr>',                   {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bn', '<cmd>bn<cr>',                   {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bp', '<cmd>bp<cr>',                   {noremap=true})

vim.cmd([[au BufReadPost *.jet set syntax=html]])
vim.cmd([[au BufEnter *.rs colorscheme deep-space]])

require('treesitter')
require('nvim-lspconfig')
require('nvim-cmp')
require('rust-tools').setup({})
require('lspsaga').init_lsp_saga()
