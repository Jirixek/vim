" Install vim-plug if not present
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
				\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" Initialize plugin system
call plug#begin(stdpath('data') . '/plugged')

" Big boys
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Konfekt/FastFold'

" System integration
Plug 'rbgrouleff/bclose.vim'
Plug 'christoomey/vim-tmux-navigator'

" Theme
Plug 'cocopon/iceberg.vim'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'

" Other
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-commentary'

call plug#end()


let PLUGINDIR = fnamemodify(expand("$MYVIMRC"), ":p:h") . '/config/plugin/'

execute 'source' PLUGINDIR . 'coc.vimrc'
execute 'source' PLUGINDIR . 'neomake.vimrc'
execute 'source' PLUGINDIR . 'vim-tmux-navigator.vimrc'
execute 'source' PLUGINDIR . 'fastfold.vimrc'

runtime macros/matchit.vim
