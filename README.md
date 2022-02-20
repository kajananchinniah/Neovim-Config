# Vim-Config

This repo serves to backup my neovim config file. I ended up making this public
again for convenience.

## Installation.
Get Vim Plug (https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Afterwards, simply copy and paste the init.vim file into `~/.config/nvim/init.vim`.

Then just install the plugins inside neovim using:
```
:PlugInstall
```
Afterwards, the plugins will install. Afterwards, quit and neovim should be configured.

Vim support is likely indentical but I haven't tested it on Vim (I have a few
neovim specific plugins for lsp, treesitter and autocompletion support)

To use the fixers and linters, you should install the relevant linters + fixers
(see the config file for the relevant ones). You also will need to install any
LSPs that you want.

## Key Features
- fzf to search for files fast
- Lightline to make the status bar at the bottom nicer
- NerdTREE for looking for things within a directory / explore directories fast
- ALE for linting + formatting of code (customized for C++, CUDA, C & Python)
- A default clang-format config (that will be overwritten by a .clang-format
  file)
- LSP support via nvim-lspconfig (requires neovim 0.5v+)
- Treesitter support for better highlighting
- Vimagit to use git better
- Solarized colourscheme
- Autocomplete via nvim-cmp
- A few other nice settings (e.g. mapping tap to 4 spaces, line numbers, etc)

For specifics about the bindings, see `init.vim` for details.

## TODO
- Refactor to lua to clean things up (I temporarily made the repo private to do
  this but I procrastinated)
