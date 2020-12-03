" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
if &compatible
	set nocompatible
endif

filetype plugin indent on
syntax on
set background=dark
set termguicolors                         " Enable true color in the terminal
colorscheme iceberg
let &t_ut=''					" Disable background color erase
set encoding=utf-8
set clipboard=unnamedplus			" Use system clipboard

set backspace=indent,eol,start		" Allow backspacing over everything in insert mode.
set history=1000					" Keep 1000 lines of command line history
set ruler						" Show the cursor position all the time
set showcmd						" Display incomplete commands
set wildmenu					" Display completion matches in a status line
set display=truncate				" Show @@@ in the last line if it is truncated.
set hidden						" Enable jumping in modified arglist without '!'
set ttimeout					" Time out for key codes
set ttimeoutlen=10				" Wait up to 10ms after Esc for special key
set nrformats-=octal				" Do not recognize octal numbers for <C-a> and <C-x>
set hlsearch incsearch ignorecase		" Search settings

if has('nvim')
	set inccommand=nosplit
endif

set smartcase
set infercase					" Autocompletion - include words starting with lowercase
set tabstop=6 shiftwidth=6			" Tab width
set scrolloff=4					" Follow cursor when scrolling
set splitbelow splitright			" Splits open at the bottom and right
set formatprg=par\ tdw80			" Use Berkeley formater for gq
set number relativenumber			" Add sidebar with line numbers
set formatoptions-=cro                    " Do not autocomment when adding new line

" set cursorline
" set cursorcolumn

runtime macros/matchit.vim
