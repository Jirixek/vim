" Install vim-plug if not present
" Bootstrap Plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
		\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" Initialize plugin system
call plug#begin(stdpath('data') . '/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-visual-star-search'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'itspriddle/vim-shellcheck'

call plug#end()

" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
if &compatible
	set nocompatible
endif

filetype plugin indent on
syntax on
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
set scrolloff=3					" Follow cursor when scrolling
set splitbelow splitright			" Splits open at the bottom and right
set formatprg=par\ tdw80			" Use Berkeley formater for gq
set number relativenumber			" Add sidebar with line numbers

runtime macros/matchit.vim

" =========
"   REMAP
" =========
let mapleader=" "

" Quickly traverse buffer lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Quickly traverse tag lists
nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
" Quickly traverse quickfix lists
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
" Quickly traverse location lists
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

" Fix the & command so it triggers with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Center when searching
nnoremap n nzz
nnoremap N Nzz

" Compile
nnoremap <f5> :wall <bar> lclose <bar> Neomake!<CR>
" Compile and create ctags
nnoremap <f6> :wall <bar> !ctags -R &<CR> <bar> :lclose <bar> Neomake!<CR>

" Switch between windows more effectively
" https://github.com/neovim/neovim/pull/2076#issuecomment-76998265
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
	tnoremap <a-h> <c-\><c-n><c-w>h
	tnoremap <a-j> <c-\><c-n><c-w>j
	tnoremap <a-k> <c-\><c-n><c-w>k
	tnoremap <a-l> <c-\><c-n><c-w>l
	tnoremap <Esc> <C-\><C-n>
endif

" Resizing windows
nnoremap <a-,> <c-w><
nnoremap <a--> <c-w>-
nnoremap <a-=> <c-w>+
nnoremap <a-.> <c-w>>

" Create two new lines and switch to insert mode
nnoremap <Leader>j o<CR>
nnoremap <Leader>k O<ESC>O
nnoremap <Leader>o o<ESC>O

" Mute highlights with <c-l>
nnoremap <silent> <c-l> :noh<CR><c-l>

" Use CTRL-G u to first break undo, so that I can CTRL-U after inserting a line break.
inoremap <c-U> <c-G>u<c-U>

" Use c-p and c-n in Ex mode so it filters history
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" Use %% as %:h in Ex Command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Map this for use in templates
nnoremap <Leader><Space> /<++><Enter>"_c4l

" ===========
"   AUTOCMD
" ===========
" Disable Caps Lock when leaving Insert or CommandLine mode
function TurnOffCaps()
	let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
	if capsState == 'on'
		silent! execute ':!xdotool key Escape'
	endif
endfunction

" Delete trailing spaces at the end of a line and under the document
function DeleteTrailingSpace()
	let l:save_view = winsaveview()
	%substitute/\s\+$//e
	silent! $global /^$/ normal "_dip
	call winrestview(l:save_view)
endfunction

augroup vimrc
	autocmd!
	" For all text files set 'textwidth' to 80 characters
	autocmd FileType text setlocal textwidth=80

	" Automatically delete all trailing whitespace
	autocmd BufWritePre * call DeleteTrailingSpace()

	" Manage Capslock
	autocmd InsertLeave * call TurnOffCaps()
	autocmd CmdlineLeave * call TurnOffCaps()
augroup end


" ============
"   SPELLING
" ============
augroup spellfiles
	autocmd!
	" Define VIMHOME variable
	let HOMEDIR = fnamemodify(expand("$MYVIMRC"), ":p:h")
	let SPELLDIR = HOMEDIR . '/spell/'

	" Set defaults
	let &spelllang = 'cs'
	let &spellfile = SPELLDIR . 'cs.utf-8.add'

	" Per file spellfile
	autocmd BufNewFile,BufRead * let &l:spellfile .= ',' . expand('%:p:') . '/.' .
				\ expand('%:t') . '.utf-8.add,'

	" Per file type spellfile (FileType autocmd seems to fire before BufNewFile)
	autocmd BufNewFile,BufRead *.tex let &spellfile .= ',' . SPELLDIR . 'cs-jargon.utf-8.add'
augroup END

" ===========
"   CUSTOM
" ===========
augroup macros
	let @c = '$s{}O'
augroup END

" ===========
"   NEOMAKE
" ===========
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 0
let g:neomake_place_signs = 0
let g:neomake_open_list = 2
