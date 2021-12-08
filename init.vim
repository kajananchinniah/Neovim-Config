" Install plugins
call plug#begin()
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
\ 'cpp': ['cc', 'ccls', 'clangcheck', 'clangtidy', 'clangd', 'clazy', 'cppcheck', 'cquery', 'flawfinder'],
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
\ 'rust': ['rustfmt'],
\}

" Style guide
let g:ale_c_clangformat_style_option= '{
\  BasedOnStyle: LLVM,
\  IndentWidth: 4,
\  BreakBeforeBraces: Linux,
\  AllowShortIfStatementsOnASingleLine: false,
\  IndentCaseLabels: false,
\}'

let g:ale_cpp_clangformat_style_option= '{
\  BasedOnStyle: LLVM,
\  IndentWidth: 4,
\  BreakBeforeBraces: Linux,
\  AllowShortIfStatementsOnASingleLine: false,
\  IndentCaseLabels: false,
\}'

let g:ale_cuda_clangformat_style_option= '{
\  BasedOnStyle: LLVM,
\  IndentWidth: 4,
\  BreakBeforeBraces: Linux,
\  AllowShortIfStatementsOnASingleLine: false,
\  IndentCaseLabels: false,
\}'

" C settings
let g:ale_c_clangformat_use_local_file=1
let g:ale_c_parse_compile_commands=1
let g:ale_c_clangd_executable='/usr/bin/clangd-10'
let g:ale_c_clangtidy_checks=[]
let g:ale_c_clangtidy_executable='/usr/bin/clang-tidy-10'
let g:ale_c_cppcheck_executable='/usr/bin/cppcheck'

" C++ settings
let g:ale_cpp_clangformat_use_local_file=1
let g:ale_cpp_parse_compile_commands=1
let g:ale_cpp_clangcheck_executable='/usr/bin/clang-check-10'
let g:ale_cpp_clangd_executable='/usr/bin/clangd-10'
let g:ale_cpp_clangtidy_checks=[]
let g:ale_cpp_clangtidy_executable='/usr/bin/clang-tidy-10'
let g:ale_cpp_cppcheck_executable='/usr/bin/cppcheck'

" CUDA settings
let g:ale_cuda_clangformat_use_local_file=1
let g:ale_cuda_clangd_executable='/usr/bin/clangd-10'

" Other
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
let g:airline#extensions#ale#enabled=1

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

" Tab mapping; 4 spaces
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Show line numbers
set number

" Highlight matching braces
set showmatch

" Allow use of mouse
set mouse=r
