setlocal makeprg=tex.sh\ %
nnoremap <f3> :silent! !okular %:r.pdf &>/dev/null &<CR><C-l>

let b:coc_pairs = [["$", "$"]]
