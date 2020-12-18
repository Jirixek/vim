augroup spelling
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
