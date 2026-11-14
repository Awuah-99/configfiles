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

" Enable system clipboard
set clipboard=unnamedplus	

" Auto-close brackets and put cursor in the middle
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>


