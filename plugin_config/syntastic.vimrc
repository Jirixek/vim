" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler_options = '-Wextra -Wformat-nonliteral -Wpointer-arith
			\ -Winline -Wundef -Wno-unused-parameter -Wcast-qual
			\ -Wwrite-strings -Wcast-align -Wfloat-equal
			\ -std=c++17 -Wall -pedantic -Wno-long-long'
let g:syntastic_cpp_compiler_options = '-Wextra -Wformat-nonliteral -Wpointer-arith
			\ -Winline -Wundef -Wno-unused-parameter -Wcast-qual
			\ -Wwrite-strings -Wcast-align -Wfloat-equal
			\ -std=c++17 -Wall -pedantic -Wno-long-long'
