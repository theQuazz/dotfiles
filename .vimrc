set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" Utils
Plug 'gmarik/Vundle.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/tpope-vim-abolish'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'w0rp/ale'

Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'mileszs/ack.vim'

" JavaScript & TypeScript
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'moll/vim-node'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Rust
Plug 'rust-lang/rust.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" colorscheme
colorscheme default

" indentation settings
set autoindent
set cindent
set expandtab
set copyindent
set preserveindent
set smartindent
set indentexpr&
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

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" 100 chars max/line
set tw=99
set wrap
set formatoptions=qrn1
" set colorcolumn=100

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
" let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'rust': ['rustfmt'],
\}
let g:ale_linters = {
\  'typescript': ['eslint', 'tsserver', 'typecheck'],
\  'rust': ['rls'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <leader>f :ALEFix<CR>

"" tsx
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.js,*.tsx,*.jsx set filetype=typescript.tsx
hi link tsxTagName keyword

"" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 1
let g:airline_powerline_fonts = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" Nerd Tree
" How can I close vim if the only window left open is a NERDTree?
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu
" Remap
nnoremap <leader>r :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

"" Nerd Comment
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1

"" FZF
nnoremap <leader>s :FZF src<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :Rg<CR>
nnoremap <leader>j :Rg!<CR>


" Ack
nnoremap <leader>a :Rg<space>

" TypeScript
let g:typescript_compiler_options = '--lib es6 --target es6'

" tsuquyomi
autocmd FileType typescript nnoremap <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_single_quote_import = 1

" Rust
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_rls_toolchain = 'stable'

if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
