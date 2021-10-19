set nocompatible
filetype plugin indent on
syntax enable

"need with termguicolors
set t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
set t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set autowrite
set cmdheight=2
set colorcolumn=80
set completeopt=menuone,noselect
"set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set hidden
set ignorecase
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set nolazyredraw
set number
set scrolloff=8
set signcolumn=yes
set shortmess+=c
set showmatch
set showmode
set shiftwidth=4
set t_Co=256
set tabstop=4
set termguicolors
set smartcase
set updatetime=100
set undodir=~/.vim/undodir
set undofile

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-compe'
Plug 'flazz/vim-colorschemes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme seattle

let g:ftplugin_sql_omni_key = '<C-P>q'

nnoremap <Space> <Nop>
let mapleader = " "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>bn <cmd>bn<cr>
nnoremap <leader>bp <cmd>bp<cr>

au BufReadPost *.jet set syntax=html

:lua require('treesitter')
:lua require('nvim-lspconfig')
:lua require('nvim-compe')
