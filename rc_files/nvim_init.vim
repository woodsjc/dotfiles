set nocompatible
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
colorscheme pablo

set autowrite
set cmdheight=2
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set noshowcmd
set nolazyredraw
set number
set shortmess+=c
set showmatch
set showmode
set shiftwidth=4
set tabstop=4
set smartcase
set updatetime=100

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
call plug#end()

let g:coc_global_extensions = [
    \ 'coc-clangd', 
    \ 'coc-css', 
    \ 'coc-git', 
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-jedi', 
    \ 'coc-json', 
    \ 'coc-julia', 
    \ 'coc-omnisharp',
    \ 'coc-markdownlint', 
    \ 'coc-powershell',  
    \ 'coc-rust-analyzer',  
    \ 'coc-sh', 
    \ 'coc-sql', 
    \ 'coc-swagger', 
    \ 'coc-tabnine',
    \ 'coc-tsserver', 
    \ 'coc-xml', 
    \ 'coc-yaml'
    \ ]

let g:go_highlight_extra_types = 0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1

nmap <slient> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)

" highlight Pmenu ctermbg=83
:colorscheme monoacc
