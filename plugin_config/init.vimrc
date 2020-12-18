let PLUGINDIR = fnamemodify(expand("$MYVIMRC"), ":p:h") . '/plugin_config/'


execute 'source' PLUGINDIR . 'coc.vimrc'
" execute 'source' PLUGINDIR . 'fastfold.vimrc'
execute 'source' PLUGINDIR . 'neomake.vimrc'
execute 'source' PLUGINDIR . 'vim-tmux-navigator.vimrc'

runtime macros/matchit.vim
