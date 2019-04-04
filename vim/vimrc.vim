" .vimrc
" Author: mlrv
" Source: https://github.com/mlrv/dotfiles/blob/master/vim/vimrc.vim

" General Vim settings {{{
execute pathogen#infect()
syntax on
colorscheme codedark
filetype plugin indent on
let mapleader=","
hi Vertsplit None
set backspace=indent,eol,start " Make sure backspace works normnally
set autoindent
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
" CtrlP {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'target\|node_modules\|DS_Store\|git'
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Syntastic {{{
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
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
silent! nmap <C-p> :NERDTreeToggle<CR> 
silent! map <F2> :NERDTreeToggle<CR> 
silent! map <F3> :NERDTreeFind<CR> 
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}

" }}}

" Languages {{{

" Language-specific tabs config
so ~/dotfiles/vim/tabs.vim

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
nnoremap <localleader>t :EnType<CR>
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = ['[^. *\t0-9]\.\w*',': [A-Z]\w', '[\[\t\( ][A-Za-z]\w*']
" }}}

" Typescript {{{
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
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

" Yank whole line to clipboard
nnoremap <C-y> "*yy<CR>

" Navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Search and replace word under cursor (with confirmation)
nnoremap  <C-s> <esc>:%s/<C-r><C-w>//gc<left><left><left>

" Folding
nnoremap <Space> za
nnoremap <leader>z zMzvzz
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

"File and Window Management {{{
nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
" }}}

