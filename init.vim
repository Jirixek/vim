" TODO: macro na odclassování
" TODO: macro na přehazování komentářu s řádkem


let HOMEDIR = fnamemodify(expand("$MYVIMRC"), ":p:h")

execute 'source' HOMEDIR . '/vim-plug.vimrc'
execute 'source' HOMEDIR . '/general.vimrc'
execute 'source' HOMEDIR . '/binds.vimrc'
execute 'source' HOMEDIR . '/marks.vimrc'
execute 'source' HOMEDIR . '/autocmd.vimrc'
execute 'source' HOMEDIR . '/spelling.vimrc'
execute 'source' HOMEDIR . '/macros.vimrc'
execute 'source' HOMEDIR . '/plugin_config/init.vimrc'
