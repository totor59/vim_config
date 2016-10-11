" turn of Vi compatibility mode
set nocompatible

" plugins will be stored relative to current file {{{1
" Eg:- ~/.vim/vimrc.vim => ~/.vim/bundle
let plugins_dir_name = 'bundle'
let vimrc_path         = resolve(expand('<sfile>'))
let vimrc_dir          = fnamemodify(vimrc_path, ':h')
let plugins_dir        = vimrc_dir . '/' . plugins_dir_name
let plugins_dir_exists = isdirectory(plugins_dir)
let vundle_dir         = plugins_dir . '/' . 'vundle'
let vundle_dir_exists  = isdirectory(vundle_dir)


" vundle configuration {{{1
filetype off
execute ':set rtp+=' . vundle_dir
call vundle#rc(plugins_dir)


" vim defaults {{{1
set showcmd
set hidden
set number
set modelines=0
set nomodeline
set ruler
set wildmode=list:full
set undolevels=100
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
set encoding=utf-8
set laststatus=2
set t_Co=256
set timeout
set timeoutlen=500
set ttimeoutlen=500
set synmaxcol=512
set ttyfast
set scrolloff=5
set backspace=indent,eol,start
set autoindent

" plugin configuration 
let g:ycm_confirm_extra_conf = 0 

" Ultisnips
" switch triggers to maintain compatibility with SuperTab & YCM
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Ctrlp
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]



" vundle managed plugins 
" core
Plugin 'gmarik/vundle'

" colorschemes
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" status bar
Plugin 'bling/vim-airline'

" code browsing
Plugin 'kien/ctrlp.vim'

" autocompletion
Plugin 'ervandew/supertab'

" snippets
Plugin 'SirVer/ultisnips'

" language common
Plugin 'scrooloose/syntastic'

" php
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" general web dev
Plugin 'tpope/vim-markdown'
Plugin 'tyru/open-browser.vim'

" wordpress
Plugin 'dsawardekar/wordpress.vim'

" vim airline themes
Plugin 'vim-airline/vim-airline-themes'

" emmet
Plugin 'mattn/emmet-vim'

" colorizer
Plugin 'lilydjwg/colorizer'

" youcompleteme
Plugin 'Valloric/YouCompleteMe'

" html5
Plugin 'othree/html5.vim'

" tmuxline
Plugin 'edkolev/tmuxline.vim'

" NERD
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'

" vimperator
Plugin 'vimperator/vimperator.vim'

if !vundle_dir_exists
  redraw!
  PluginInstall
end


" appearance 
let g:molokai_original = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" omnicompletion config
set completeopt=menu,menuone,longest
set pumheight=15


" vundle complete, turn back filetypes
filetype plugin indent on
syntax on

" NERD
"" Lance NERDTree si Vim est lancé sans params
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:nerdtree_tabs_open_on_console_startup=1

" Config Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

" CONFIG GENERALE
set mouse=a
set number
set smartindent
set t_Co=256
syntax enable

let mapleader=","
set timeout timeoutlen=1500

"Automatic colorize in html/css
let g:colorizer_auto_filetype='css,html'

let g:tmuxline_preset = 'tmux'



