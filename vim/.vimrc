syntax enable
colorscheme nord
filetype plugin indent on

let mapleader="," 
set backspace=indent,eol,start
set autoindent
set autoread
set clipboard=unnamed
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set number
set relativenumber
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set tabstop=2

nnoremap ; :
nnoremap <leader><space> :nohlsearch<CR>
nnoremap H ^
nnoremap L g_
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

command! Q q
command! W w
command! Wq wq
command! WQ wq

augroup restore_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END
