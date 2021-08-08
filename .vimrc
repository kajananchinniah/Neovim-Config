" Install plugins
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'
  Plug 'lifepillar/vim-solarized8'
call plug#end()

" Enable lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'solarized',
\ }

"ALE
let g:ale_linters = {
\ 'python': ['flake8'],
\ 'cpp': ['cpplint'],
\ 'cuda': ['cpplint'],
\ 'c': ['cpplint'],
\}

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['black', 'isort'],
\ 'cpp': ['clang-format', 'uncrustify'],
\ 'cuda': ['clang-format'],
\ 'c': ['clang-format', 'uncrustify'],
\}

let g:ale_lint_on_enter=0
let g:ale_fix_on_save=1

"Solarized color scheme
set background=dark
colorscheme solarized8

" Hotkeys
map <C-o> :NERDTreeToggle<CR>
map <C-f> :Files<CR>

"Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"Disable vi compatibility
set nocompatible

" Use indentation of previous line
set autoindent

" Smart indentation
set smartindent

" Wrap line at 120 characters
set textwidth=120

" Syntax highlighting
set t_Co=256
syntax on

" Tab mapping; 2 spaces
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Show line numbers
set number

" Highlight matching braces
set showmatch

" Allow for copying onto system clipboard
set clipboard=unnamed
