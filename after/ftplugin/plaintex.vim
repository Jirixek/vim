let HOMEDIR = fnamemodify(expand("$MYVIMRC"), ":p:h")
execute 'source' HOMEDIR . '/after/ftplugin/tex.vim'
