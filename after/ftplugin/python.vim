" ===============
"   VIM OPTIONS
" ===============
syntax on
setlocal encoding=utf-8

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=120
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

" Enable folding
" setlocal foldmethod=indent


" ===========
"   AUTOCMD
" ===========
augroup python
	autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
augroup end


" ==============
"   SimpylFold
" ==============
" let g:SimpylFold_docstring_preview = 1


CocDiagnostics
