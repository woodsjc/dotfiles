set nocompatible
filetype on

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

colorscheme ron

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-go'
call plug#end()

filetype plugin indent on
set autowrite

let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0

let g:go_fmt_autosave = 1

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set updatetime=100

syntax enable
