" .vimrc
" Author: mlrv
" Source: https://github.com/mlrv/dotfiles/blob/master/vim/vimrc.vim

" General Vim settings {{{
execute pathogen#infect()
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized8_high
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

" Ale {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
highlight ALEWarning ctermbg=none
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
let g:NERDTreeToggle = "<F2>"
let g:NERDTreeMapActivateNode = "<space>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
" }}}

" fzf {{{
set rtp+=~/.fzf
nnoremap <Leader>q :Files .<CR>
" }}}

" Goyo {{{
nnoremap <c-g> :Goyo<CR>
" }}}

" LanguageClient {{{
map gh :call LanguageClient#textDocument_hover()<CR>
map gd :call LanguageClient#textDocument_definition()<CR>
map <Leader>e :call LanguageClient#textDocument_rename()<CR>
map <Leader>r :call LanguageClient#textDocument_formatting()<CR>
" }}}

" }}}

" Languages {{{
so ~/dotfiles/vim/tabs.vim

" Haskell {{{
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set runtimepath+=~/.vim/bundle/LanguageClient-neovim
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper']  }
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
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
nnoremap <leader>z zMzvzz

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

