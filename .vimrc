" indentation settings (2 spaces, always spaces)
set expandtab
set smartindent
set cindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" scroll off
set scrolloff=5

" fix backspace
set backspace=indent,eol,start

" line numbers
set rnu
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

" background is dark!
set background=dark

" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/syntastic'
Plugin 'derekwyatt/vim-scala'
Plugin 'itchyny/lightline.vim'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'gavocanov/vim-js-indent'
Plugin 'othree/es.next.syntax.vim'

call vundle#end()
filetype plugin indent on

" colorscheme
colorscheme koehler

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_cpp_checkers = ["u++","g++"]

" command-t
nnoremap <C-y> :CommandT<CR>

" jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'right': [ [ 'lineinfo', 'syntastic' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ }
      \ }
