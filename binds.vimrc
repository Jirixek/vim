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
nnoremap <Leader>O O<ESC>o

" Disable/enable autocommenting
map <Leader>c :setlocal formatoptions-=cro<CR>
map <Leader>C :setlocal formatoptions+=cro<CR>

" Enable spell checking
map <Leader>s :setlocal spell!<CR>

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
