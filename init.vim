" TODO: add V global reg
"
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
Plug 'christoomey/vim-tmux-navigator'

Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

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

" set cursorline
" set cursorcolumn

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

" Switch between windows more effectively (also with vim-tmux-navigator)
" https://github.com/neovim/neovim/pull/2076#issuecomment-76998265
nnoremap <a-h> :TmuxNavigateLeft<CR>
nnoremap <a-j> :TmuxNavigateDown<CR>
nnoremap <a-k> :TmuxNavigateUp<CR>
nnoremap <a-l> :TmuxNavigateRight<CR>
vnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
vnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
vnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
vnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
inoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
inoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
inoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
inoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
cnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
cnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
cnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
cnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
if has('nvim')
	tnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
	tnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
	tnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
	tnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
	tnoremap <Esc> <c-\><c-n>
endif
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Resizing windows
nnoremap <a-,> <c-w><
nnoremap <a--> <c-w>-
nnoremap <a-=> <c-w>+
nnoremap <a-.> <c-w>>

" Create two new lines and switch to insert mode
nnoremap <Leader>j o<CR>
nnoremap <Leader>k O<ESC>O
nnoremap <Leader>o o<ESC>O

" Disable/enable autocommenting
map <Leader>c :setlocal formatoptions-=cro<CR>
map <Leader>C :setlocal formatoptions+=cro<CR>

" Enable spell checking
map <Leader>s :setlocal spell!

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

" lf
nnoremap <Leader>f :LfWorkingDirectory<CR>
nnoremap <Leader>t :LfWorkingDirectoryExistingOrNewTab<CR>

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

" ======
"   lf
" ======
" Open lf when vim open a directory
let g:lf_replace_netrw = 1
" Use custom mappings
let g:lf_map_keys = 0

" ======================
"   vim-tmux-navigator
" ======================
" Use custom bindings
let g:tmux_navigator_no_mappings = 1
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
