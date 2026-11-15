" BASIC SETUP
set nocompatible	" Disable vi compatibility
"set number		  Show line number
set relativenumber	" Show relative line numbers
set tabstop=4		" A tab is 4 spaces
set shiftwidth=4	" Indent by 4 spaces
set smartindent		" Auto-indent new lines
set wrap		" wrap long lines
set showmatch		" Highlight matching brackets
set ignorecase smartcase
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

