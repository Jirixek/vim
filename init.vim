" TODO: macro na odclassování
" TODO: macro na přehazování komentářu s řádkem


let CONFDIR = fnamemodify(expand("$MYVIMRC"), ":p:h") . '/config/'

execute 'source' CONFDIR . 'vim-plug.vimrc'
execute 'source' CONFDIR . 'general.vimrc'
execute 'source' CONFDIR . 'binds.vimrc'
execute 'source' CONFDIR . 'marks.vimrc'
execute 'source' CONFDIR . 'autocmd.vimrc'
execute 'source' CONFDIR . 'macros.vimrc'
execute 'source' CONFDIR . 'spelling.vimrc'
execute 'source' CONFDIR . 'plugin/init.vimrc'
