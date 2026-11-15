" BASIC SETUP
set nocompatible	" Disable vi compatibility
"set number		  Show line number
set relativenumber	" Show relative line numbers
set tabstop=4		" A tab is 4 spaces
set shiftwidth=4	" Indent by 4 spaces
set smartindent		" Auto-indent new lines
set wrap		" wrap long lines
set showmatch		" Highlight matching brackets
set ignorecase
set smartcase

set hidden		" Allow switch buffers without saving
set updatetime=300	" Faster git sign and linting saving
set history=500		" VIM history size
set hlsearch		" Highlight search results
set magic			" For regular expressions

set nobackup		" Turn off file-backup
set noswapfile
set nowb

" Enable system clipboard
set clipboard=unnamedplus	

" Auto-close brackets and put cursor in the middle
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" COLORS AND FONT
syntax enable		" Enable syntax highlighting
set regexpengine=0  " Set regular expression engine

" Enable 256 colors palete in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme desert
catch
endtry

set background=dark
set encoding=utf8

" AUTOCOMPLETE POPUP
set completeopt=menuone,noinsert   " show menu even for one match; highlight first item without inserting it
set shortmess+=c                   " hide "match 1 of N" messages
set pumheight=10                   " max 10 items in the popup
set complete=.,w,b,u               " words from current buffer, windows, buffers (skips slow include scanning)

" Open the popup automatically after typing 2+ keyword characters
function! s:AutoComplete()
	if !pumvisible() && getline('.')[:col('.')-2] =~ '\k\k$'
		call feedkeys("\<C-n>", 'n')
	endif
endfunction
autocmd TextChangedI * call s:AutoComplete()

" Tab accepts the highlighted suggestion (or inserts a normal tab if no popup)
inoremap <expr> <Tab>   pumvisible() ? "\<C-y>" : "\<Tab>"
" Shift-Tab / Ctrl-n / Ctrl-p to move through the list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
