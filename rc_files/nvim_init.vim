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

"let g:coc_global_extensions = [
"    \ 'coc-clangd', 
"    \ 'coc-css', 
"    \ 'coc-db',
"    \ 'coc-git', 
"    \ 'coc-go',
"    \ 'coc-html',
"    \ 'coc-jedi', 
"    \ 'coc-json', 
"    \ 'coc-julia', 
"    \ 'coc-omnisharp',
"    \ 'coc-markdownlint', 
"    \ 'coc-powershell',  
"    \ 'coc-rust-analyzer',  
"    \ 'coc-sh', 
"    \ 'coc-sql', 
"    \ 'coc-swagger', 
"    \ 'coc-tabnine',
"    \ 'coc-tsserver', 
"    \ 'coc-xml', 
"    \ 'coc-yaml'
"    \ ]

colorscheme seattle

"let g:go_gopls_options = ['-remote=auto']
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_types = 1
"let g:go_fmt_autosave = 1
"let g:go_auto_sameids = 0
"let g:go_auto_type_info = 1
"let g:go_code_completion_enabled = 1

nnoremap <Space> <Nop>
let mapleader = " "

"nmap <slient> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-reference)

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>bn <cmd>bn<cr>
nnoremap <leader>bp <cmd>bp<cr>

"au FileType go nnoremap gd :GoDefinition<CR>
"au FileType go nnoremap gy :GoTypeDefinition<CR>
"au FileType go nnoremap gi :GoImplements<CR>
"au FileType go nnoremap gr :GoReferrers<CR>
"au FileType go nnoremap <leader>rr :GoRename<CR>

au BufReadPost *.jet set syntax=html

:lua require('treesitter')
:lua require('nvim-lspconfig')
:lua require('nvim-compe')
