" python
let g:python_host_prog = "/Users/quazz/neovim2/bin/python"
let g:python3_host_prog = "/Users/quazz/neovim3/bin/python"

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Utils
Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/tpope-vim-abolish'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'wincent/command-t', { 'do': 'bundle install && rake make' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" JavaScript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
" Plug 'gavocanov/vim-js-indent'
" Plug 'flowtype/vim-flow'
Plug 'moll/vim-node'
" Plug 'ruanyl/vim-fixmyjs'

" Ruby
Plug 'slim-template/vim-slim'

" Scala
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
" Plug 'derekwyatt/vim-scala'

call plug#end()

" colorscheme
" colorscheme koehler

" indentation settings
set autoindent
set expandtab
set copyindent
set preserveindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" have edited buffers that aren't visible in a window somewhere
set hidden

" scroll off
set scrolloff=5

" fix backspace
set backspace=indent,eol,start

" line numbers
set rnu
set nu

" stuff from http://stevelosh.com/blog/2010/09/coming-home-to-vim/?
let mapleader = ","
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
inoremap <C-c> <Esc>

" macros
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q gqip
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>ex yy:@"
nnoremap <leader>y :! /usr/local/bin/ctags -f .git/tags -R .<cr>
nnoremap <leader>p :cclose<CR>

" syntax
syntax on

" undofile
set undofile
set undodir=$HOME/.vim/undo/ " ! make this directory !
set undolevels=1000
set undoreload=10000

" 100 chars max/line
set tw=99
set wrap
set formatoptions=qrn1
set colorcolumn=100

" mouse
if has('mouse') | set mouse=a | endif

" background is dark!
set background=dark

" reduce lag
syntax sync minlines=256

" Ale
let g:ale_sign_error = "╳"
let g:ale_sign_warning = "⚠"
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = { 'javascript': ['eslint'] }
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <leader>f :ALEFix<CR>

"" Ensime
" autocmd BufWritePost *.scala silent :EnTypeCheck
" let ensime_server_v2=1
" nnoremap <leader>t :EnTypeCheck<CR>

"" jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" Nerd Tree
" How can I close vim if the only window left open is a NERDTree?
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Remap
nnoremap <leader>r :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

"" Nerd Comment
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1

"" Command-T
let g:CommandTFileScanner = 'git'
nnoremap <leader>. :CommandTTag<cr>
nnoremap <C-t> :CommandT<CR>

"" deoplete
" call deoplete#enable()
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

": Fixmyjs
" let g:fixmyjs_use_local = 1
" let g:fixmyjs_engine = 'eslint'
" let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.json']
" let g:fixmyjs_executable = 'eslint_d'
" nnoremap <leader>f :Fixmyjs<CR>

" Ack
nnoremap <leader>a :Ack<space>
