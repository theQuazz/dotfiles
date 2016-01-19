" indentation settings (2 spaces, always spaces)
set expandtab
set smartindent
set cindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" line numbers
set nu

" syntax
syntax on

" undofile
set undofile
set undodir=$HOME/.vim/undo/ " ! make this directory !
set undolevels=1000
set undoreload=10000

" 80 chars max/line
set tw=80
set formatoptions+=t

" scrolloff
set scrolloff=5

" relative line numbers
set rnu

" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on

" statusline
set statusline=%1*%f\ %m%r\ %=\ %l\,%c\ (%p%%)
set laststatus=2

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ["eslint","jshint"]
let g:syntastic_cpp_checkers = ["u++"]

" command-t
nnoremap <C-y> :CommandT<CR>
