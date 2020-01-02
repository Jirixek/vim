setlocal makeprg=tex.sh\ %
nnoremap <f6> :silent! !evince %:r.pdf &>/dev/null &<CR><C-l>
