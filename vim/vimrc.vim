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
set backspace=indent,eol,start " Make sure backspace works normnally
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
" }}}

" Plugins {{{

" Fugitive {{{
nnoremap <leader>g <esc>:Gdiff<CR>
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Ale {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" }}}

" qf {{{
 nmap <F5> <Plug>(qf_qf_toggle)
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
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<space>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}

" fzf {{{
set rtp+=~/.fzf
nnoremap <C-p> :GFiles .<CR>
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
set tags=./tags;,tags;
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
	\ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
	\ }
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
		\ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
		\ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
			\ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
			\ }
" }}}

" Goyo {{{
nnoremap <c-g> :Goyo<CR>
" }}}

" }}}

" Languages {{{
so ~/dotfiles/vim/tabs.vim
set runtimepath+=~/.vim/bundle/LanguageClient-neovim

" Haskell {{{
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
" }}}

" Scala {{{
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <leader>t :EnType<CR>
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = ['[^. *\t0-9]\.\w*',': [A-Z]\w', '[\[\t\( ][A-Za-z]\w*']
" }}}

" Typescript {{{
let g:tsuquyomi_disable_quickfix = 1
" }}}

" }}}

" Cursor {{{
" Set cursor shape for different modes
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
		\ if v:insertmode == 'i' |
		\   silent execute '!echo -ne "\e[6 q"' | redraw! |
		\ elseif v:insertmode == 'r' |
		\   silent execute '!echo -ne "\e[4 q"' | redraw! |
		\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" }}}

" Custom commands and bindings {{{
"Fat fingers
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
