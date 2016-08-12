" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'gavocanov/vim-js-indent'
Plugin 'othree/es.next.syntax.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" colorscheme
" colorscheme koehler

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

" reduce lag
syntax sync minlines=256

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = "eslint_d"

let g:syntastic_cpp_checkers = ["g++"]

let g:syntastic_c_checkers = ["gcc"]
let g:syntastic_c_gcc_exec = "arm-none-eabi-gcc"
let g:syntastic_c_config_file = ".syntastic_c_config"
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_check_header = 1

let g:syntastic_asm_gcc_exec = "arm-none-eabi-gcc"

" command-t
nnoremap <C-t> :CommandT<CR>

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
