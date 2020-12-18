setlocal makeprg=g++.sh\ -c\ %


function Compile()
	lclose
	Neomake!
endf

function CompileWithCTags()
	wall
	silent execute '!ctags -R &'
	call Compile()
endf


augroup c
	autocmd BufWritePost * call Compile()
augroup end


" Compile and create ctags
nnoremap <f5> :call CompileWithCTags()<CR>
