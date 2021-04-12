set nocompatible
filetype plugin indent on
syntax enable

"need with termguicolors
set t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
set t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set autowrite
set cmdheight=2
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set nobackup
set noerrorbells
"set noshowcmd
set noshowmode
set noswapfile
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-dadbod'
Plug 'puremourning/vimspector'
call plug#end()

let g:coc_global_extensions = [
    \ 'coc-clangd', 
    \ 'coc-css', 
    \ 'coc-db',
    \ 'coc-go',
    \ 'coc-git', 
    \ 'coc-html',
    \ 'coc-jedi', 
    \ 'coc-json', 
    \ 'coc-julia', 
    \ 'coc-omnisharp',
    \ 'coc-markdownlint', 
    \ 'coc-powershell',  
    \ 'coc-rust-analyzer',  
    \ 'coc-sh', 
    \ 'coc-swagger', 
    \ 'coc-tabnine',
    \ 'coc-tsserver', 
    \ 'coc-xml', 
    \ 'coc-yaml'
    \ ]

let g:go_gopls_options = ['-remote=auto']
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1
let g:go_code_completion_enabled = 1

let g:delve_backend = "native"
let g:viminspector_enable_mappings = 'HUMAN'

nnoremap <Space> <Nop>
let mapleader = " "

nnoremap <slient> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-reference)

au FileType go nnoremap gd :GoDefinition<CR>
au FileType go nnoremap gy :GoTypeDefinition<CR>
au FileType go nnoremap gi :GoImplements<CR>
au FileType go nnoremap gr :GoReferrers<CR>

"colorscheme monoacc
colorscheme void
