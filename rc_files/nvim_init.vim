set nocompatible
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
colorscheme pablo

set autowrite
set noshowcmd
set nolazyredraw
set showmatch
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set number
set incsearch
set hlsearch
set cursorline
set updatetime=100

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'flazz/vim-colorschemes'
call plug#end()

let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0

let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1

let g:coc_global_extensions = [
    \ 'coc-clangd', 
    \ 'coc-css', 
    \ 'coc-git', 
    \ 'coc-go', 
    \ 'coc-jedi', 
    \ 'coc-json', 
    \ 'coc-julia', 
    \ 'coc-markdownlint', 
    \ 'coc-powershell',  
    \ 'coc-rust-analyzer',  
    \ 'coc-sh', 
    \ 'coc-sql', 
    \ 'coc-swagger', 
    \ 'coc-tsserver', 
    \ 'coc-xml', 
    \ 'coc-yaml'
    \ ]

" highlight Pmenu ctermbg=83
:colorscheme monoacc
