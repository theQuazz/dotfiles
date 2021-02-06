set nocompatible
filetype off

" set the runtime path to include Plugged and initialize
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/tpope-vim-abolish'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" LightLine
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" JavaScript & TypeScript
Plug 'pangloss/vim-javascript'     " JavaScript support
Plug 'leafgarland/typescript-vim'  " TypeScript syntax
Plug 'peitalin/vim-jsx-typescript' " Syntax Highlighting
Plug 'moll/vim-node'               " Node utils (go to file)

" Prisma
Plug 'pantharshit00/vim-prisma'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terraform
Plug 'hashivim/vim-terraform'

" Colorschemes
Plug 'flazz/vim-colorschemes'

call plug#end()

" colorscheme
colorscheme Tomorrow-Night

" syntax
syntax on

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

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

" This TypeScript guy https://github.com/nikolalsvk/dotfiles/blob/master/.vimrc
" https://medium.com/swlh/ultimate-vim-typescript-setup-35b5ac5c8c4e
set ttyfast
set lazyredraw
set updatetime=300

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
nnoremap <C-c> <Esc>

" macros
nnoremap <leader><space> :noh<cr> " remove highlights
nnoremap <leader>q gqip
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>l

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

" remove vert bar |
set fillchars+=vert:\ 

" mouse
if has('mouse') | set mouse=a | endif

" reduce lag
syntax sync minlines=256

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

" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Open test file for a current file in a vertical window
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>/ :split<CR>

" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Ack
nnoremap <leader>a :Rg<space>

" TypeScript
autocmd BufNewFile,BufRead *.js,*.tsx,*.jsx set filetype=typescript.tsx
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']
" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
highlight tsxTagName ctermfg=Blue
highlight tsxComponentName ctermfg=Blue
highlight tsxCloseComponentName ctermfg=Blue
highlight Label ctermfg=Red
highlight Conditional ctermfg=Red
highlight typescriptStatement ctermfg=Red

" CoC
set tagfunc=CocTagFunc
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set signcolumn=number " always show gutter
highlight clear SignColumn
highlight CocWarningSign ctermfg=216
highlight CocErrorSign ctermfg=167
highlight CocInfoSign ctermfg=246

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Next/prev diagnostic problem
nmap <C-g> <Plug>(coc-diagnostic-next)
nmap <C-h> <Plug>(coc-diagnostic-prev)
" Apply AutoFix to file
nmap <leader>f :CocCommand eslint.executeAutofix<CR>
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)
" For showing completion options
inoremap <silent><expr> <C-@> coc#refresh()

" For Tab Completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Lightline
let g:tmuxline_powerline_separators = 0
let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_info', 'coc_hint'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype'] ]
  \ },
  \ 'component_expand': {
  \   'coc_error': 'StatusDiagnosticError',
  \   'coc_warning': 'StatusDiagnosticWarning',
  \   'coc_info': 'StatusDiagnosticInfo',
  \   'coc_hint': 'StatusDiagnosticHint',
  \ },
  \ 'component_type': {
  \   'coc_error': 'error',
  \   'coc_warning': 'warning',
  \   'coc_info': 'tabsel',
  \   'coc_hint': 'middle',
  \ },
\ }

function! StatusDiagnostic(kind) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  return '● ' . info[a:kind]
endfunction

function! StatusDiagnosticError() abort
  return StatusDiagnostic('error')
endfunction

function! StatusDiagnosticWarning() abort
  return StatusDiagnostic('warning')
endfunction

function! StatusDiagnosticInfo() abort
  return StatusDiagnostic('information')
endfunction

function! StatusDiagnosticHint() abort
  return StatusDiagnostic('hints')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
