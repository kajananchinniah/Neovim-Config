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

" Linters
let g:ale_linters = {
\ 'python': ['flake8', 'pylint'],
\ 'cpp': ['cc', 'ccls', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cquery', 'flawfinder'],
\ 'cuda': ['clangd', 'nvcc'],
\ 'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\ 'cmake': ['cmakelint']
\}

" Fixers
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['autoflake', 'autoimport', 'black', 'isort'],
\ 'cpp': ['clang-format'],
\ 'cuda': ['clang-format'],
\ 'c': ['clang-format'],
\ 'cmake': ['cmakeformat'],
\}

" Style guide
let g:ale_c_clangformat_style_option='{BasedOnStyle: Google, }'
let g:ale_cpp_clangformat_style_option='{BasedOnStyle: Google, }'
let g:ale_cuda_clangformat_style_option='{BasedOnStyle: Google,}'

let g:ale_lint_on_enter=0
let g:ale_fix_on_save=1

" Quick search for ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"Solarized color scheme
set background=dark
colorscheme solarized8

" Prevent color scheme from changing background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

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

" Wrap line at 80 characters
set textwidth=80

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

" Enable using mouse (can be convenient)
:set mouse=a
