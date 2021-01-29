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
Plug 'Valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive && GOFLAGS=-modcacherw ./install.py --clang-completer --racer-completer --omnisharp-completer --tern-completer --go-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'racer-rust/vim-racer'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0

let g:go_fmt_autosave = 1
"let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_add_preview_to_completeopt="popup"
let g:ycm_autoclose_preview_window_after_completion = 1

"let g:racer_cmd = "$HOME/.cargo/bin/racer"
"let g:racer_experimental_complete = 1

let g:OmniSharp_server_stdio = 1

highlight Pmenu ctermbg=83
