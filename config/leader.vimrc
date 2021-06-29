" Create two new lines and switch to insert mode
nnoremap <Leader>j o<CR>
nnoremap <Leader>k O<ESC>O
nnoremap <Leader>o o<ESC>O
nnoremap <Leader>O O<ESC>o

" Disable/enable autocommenting
nnoremap <Leader>c :setlocal formatoptions-=cro<CR>
nnoremap <Leader>C :setlocal formatoptions+=cro<CR>

" Enable spell checking
nnoremap <Leader>s :setlocal spell!<CR>

" We use this in templates
nnoremap <Leader><Space> /<++><Enter>"_c4l

" When you want to implement class declaration
noremap <Leader>f :s/;$/\r{\r\r}\r/<CR>
noremap <Leader>F :s/\(\w*\)\((.*)\);/<++>::\1\2\r{\r\r}\r/<CR>
