" Plugins
	execute pathogen#infect()

	let g:haskellmode_completion_ghc = 1
	autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Syntastic
	map <Leader>s :SyntasticToggleMode<CR>
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0

" deoplete
	let g:deoplete#enable_at_startup = 1


" General Vim settings
	syntax on
	filetype plugin indent on
	let mapleader=","
	set autoindent
	set tabstop=2
	set shiftwidth=2
	set noexpandtab
	set dir=/tmp/	
	set relativenumber 
	set number

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	map <up> <nop>
	map <down> <nop>
	map <left> <nop>
	map <right> <nop>

	nmap <silent> <c-k> :wincmd k<CR>
	nmap <silent> <c-j> :wincmd j<CR>
	nmap <silent> <c-h> :wincmd h<CR>
	nmap <silent> <c-l> :wincmd l<CR>

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Change cursor in Insert mode
	autocmd InsertEnter * set cul
	autocmd InsertLeave * set nocul

" Language Specific
	" Brackets
		inoremap { {<CR>}<Esc>O<TAB>

	" Tabs
		so ~/dotfiles/vim/tabs.vim

	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
		
	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>

	" Haskell
		set clipboard=unnamedplus,autoselect
		set completeopt=menuone,menu,longest
		set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
		set wildmode=longest,list,full
		set wildmenu
		set completeopt+=longest

" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Auto load
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	set autoread 
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Search and replace word under cursor
	nnoremap  <C-s> <esc>:%s/<C-r><C-w>//gc<left><left><left>

" Indent (temporarily disable these until I find a better solution)
	"nnoremap <TAB> >>
	"nnoremap <S-TAB> <<
	"vnoremap <TAB> >gv
	"vnoremap <S-TAB> <gv
