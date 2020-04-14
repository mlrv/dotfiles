" .vimrc
" Author: mlrv
" Source: https://github.com/mlrv/dotfiles/blob/master/vim/vimrc.vim

" General Vim settings {{{
execute pathogen#infect()
syntax enable
colorscheme nord
filetype plugin indent on
let mapleader=","
hi Vertsplit None
set backspace=indent,eol,start " Make sure backspace works normally
set autoindent
set hlsearch
set ignorecase
set smartcase
set incsearch
set tabstop=2
set shiftwidth=2
set noexpandtab
set dir=/tmp/
set number
set relativenumber
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set foldlevel=0
set modelines=1
set showbreak=↪
" }}}

" Plugins {{{

" Fugitive {{{
nnoremap <leader>g <esc>:Gdiff<CR>
" }}}

" qf {{{
 nmap <F5> <Plug>(qf_qf_toggle)
 autocmd FileType qf setlocal wrap
 " }}}

" Gitgutter {{{
let g:gitgutter_sign_added = '.'
let g:gitgutter_sign_modified = '.'
let g:gitgutter_sign_removed = '.'
let g:gitgutter_sign_modified_removed = '.'
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" }}}

" Nerdtree {{{
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode = "<space>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
" }}}

" {{{ maximizer
command Max MaximizerToggle
" }}}

" fzf {{{
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp'  }  }
set rtp+=/usr/local/opt/fzf
nnoremap <Leader>q :Files .<CR>
" }}}

" Goyo {{{
nnoremap <leader>z :Goyo<CR>
" }}}

" CoC {{{
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" Type under cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>
" Show all diagnostics
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" }}}

" }}}

" Custom commands and bindings {{{

" Paste from system clipboard
set pastetoggle=<leader>v

" Fat fingers
command! Q :q
command! W :w
command! Wq :wq
command! WQ :wq

" Avoid using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Select whole line (without indentation)
nnoremap vv ^v$

" Navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Search and replace word under cursor (with confirmation)
nnoremap  <leader>s <esc>:%s/<C-r><C-w>//gc<left><left><left>

" Folding
nnoremap <Space> za

" Generic
nnoremap ; :
noremap <leader><space> :noh<CR>
map <tab> %
nnoremap D d$
nnoremap S i<CR><esc>
nnoremap n nzzzv
nnoremap N Nzzzv
noremap H ^
noremap L g_
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" }}}

" Generic {{{
" Quickfix highlight colour
hi QuickFixLine term=reverse ctermbg=52
hi SpellBad ctermbg=52
hi SpellCap ctermbg=52

" Return to the same line you left off at
augroup line_return
au!
au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	execute 'normal! g`"zvzz' |
	\ endif
augroup END

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
set autoread

" Notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

