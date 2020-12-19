" ===============
"   VIM OPTIONS
" ===============
setlocal encoding=utf-8
setlocal fileformat=unix

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=120
setlocal expandtab

" Enable folding
" setlocal foldmethod=indent

" ===========
"   AUTOCMD
" ===========
highlight BadWhitespace ctermbg=red guibg=darkred
augroup python
	autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
augroup end

" ==============
"   SimpylFold
" ==============
" let g:SimpylFold_docstring_preview = 1
