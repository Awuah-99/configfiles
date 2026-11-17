" PLUGINS
" Auto-install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'        " Auto-close brackets and quotes
Plug 'lifepillar/vim-mucomplete'   " Autocomplete popup as you type
Plug 'andymass/vim-matchup'        " Better % bracket/keyword matching
call plug#end()

" BASIC SETUP
set nocompatible	" Disable vi compatibility
filetype plugin indent on
"set number		  Show line number
set relativenumber	" Show relative line numbers
set cursorline		" Highlight current line
set scrolloff=8		" Keep context lines around cursor
set laststatus=2	" Always show status line
set wildmenu		" Better command-line completion
set mouse=a		" Mouse support
set backspace=indent,eol,start
set splitright splitbelow

" Indentation (real tabs)
set noexpandtab		" Keep tab characters
set tabstop=4		" A tab is 4 spaces wide
set shiftwidth=4	" Indent by 4 spaces
set softtabstop=4
set smartindent		" Auto-indent new lines
set wrap		" Wrap long lines

" Search
set showmatch		" Highlight matching brackets
set ignorecase smartcase
set incsearch		" Search as you type
set hlsearch		" Highlight search results
set magic		" For regular expressions
nnoremap <Esc><Esc> :nohlsearch<CR>

" Buffers, history, files
set hidden		" Allow switch buffers without saving
set updatetime=300	" Faster git sign and linting saving
set history=500		" VIM history size
set nobackup		" Turn off file-backup
set noswapfile
set nowb

" Persistent undo
if !isdirectory($HOME . '/.vim/undo')
	call mkdir($HOME . '/.vim/undo', 'p')
endif
set undofile
set undodir=~/.vim/undo

" Enable system clipboard
set clipboard=unnamedplus

" AUTOCOMPLETE (vim-mucomplete)
set completeopt=menuone,noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 100

" AUTO-PAIRS
" Enter accepts the completion if the menu is open, otherwise
" it expands pairs like {<Enter> into an indented block
let g:AutoPairsMapCR = 0
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<C-r>=AutoPairsReturn()\<CR>"

" COLORS AND FONT
syntax enable		" Enable syntax highlighting
set regexpengine=0	" Set regular expression engine

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme desert
catch
endtry

set background=dark
set encoding=utf8
