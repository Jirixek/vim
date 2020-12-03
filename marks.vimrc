function! SetGMark(mark, filename, line_nr)
    let l:mybuf = bufnr(a:filename, 1)
    call setpos("'".a:mark, [l:mybuf, a:line_nr, 1, 0])
endf

call SetGMark('V', expand("$MYVIMRC"), 1)
