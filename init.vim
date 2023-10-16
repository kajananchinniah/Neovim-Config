" Install plugins
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'Yagua/nebulous.nvim'
  Plug 'sainnhe/sonokai'
  Plug 'morhetz/gruvbox'
  Plug 'ishan9299/nvim-solarized-lua'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'tpope/vim-sleuth'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'j-hui/fidget.nvim'
call plug#end()

" Enable lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'terafox',
\ }

set completeopt=menu,menuone,noselect

" LSP
lua << EOF

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`

require('ibl').setup {
  indent = { char = "┊" },
    whitespace = {
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names
  ensure_installed = {'python', 'lua', 'cpp', 'c', 'cuda', 'cmake', 'yaml', 'bash'},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  -- List of parsers to ignore installing
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

-- Setup nvim-cmp.
local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'clangd', 'pyright', 'hls' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
end

require('nightfox').setup({
  options = {
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

EOF

"ALE

" Linters
let g:ale_linters = {
\ 'python': ['flake8', 'pylint', 'pylama'],
\ 'cpp': ['cc', 'ccls', 'clangcheck', 'clangtidy', 'clangd', 'cppcheck', 'flawfinder'],
\ 'cuda': ['clangd', 'nvcc'],
\ 'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'flawfinder'],
\ 'cmake': ['cmakelint'],
\ 'rust': [ 'analyzer', 'cargo', 'rustc'],
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
\ 'bzl': ['buildifier'],
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
let g:ale_c_clangtidy_checks=[]

" C++ settings
let g:ale_cpp_clangformat_use_local_file=1
let g:ale_cpp_parse_compile_commands=1
let g:ale_cpp_clangtidy_checks=[]

" CUDA settings
let g:ale_cuda_clangformat_use_local_file=1

" Other
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
let g:airline#extensions#ale#enabled=1

let g:ale_lint_on_enter=0
" let g:ale_fix_on_save=1

" Quick search for ALE errors
nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" Colour scheme
set termguicolors
autocmd VimEnter * hi Normal ctermbg=none
colorscheme terafox

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

" Highlight on search
set hlsearch

" Case insensitive searching unless /C or capital in search
set ignorecase
set smartcase

" Decrease update time
set updatetime=250
set signcolumn=yes

" Break indent
set breakindent

" Undo history
set undofile

" Allow use of mouse
set mouse=a

" Support clipboard
set clipboard+=unnamedplus
