" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_c_config_file = expand("$HOME") . '/.local/src/cpp_compilation_flags.txt'
let g:syntastic_cpp_config_file = expand("$HOME") . '/.local/src/cpp_compilation_flags.txt'
