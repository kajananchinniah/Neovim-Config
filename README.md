# Vim-Config

This repo serves to backup my neovim config file.

## Installation
Get Vim Plug (https://github.com/junegunn/vim-plug)

Vim:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Afterwards, simply copy and paste the init.vim file into your .vimrc file and install inside vim using:
```
:PlugInstall
```
Afterwards, the plugins will install. Afterwards, quit and vim should be configured. Note: I'm unsure about the compatability with Vim (as I've stopped using Vim; a few plugins are Neovim specific).

Neovim:
Get Vim Plug (https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Afterwards, simply copy and paste the .vimrc file into `~/.config/nvim/init.vim`.

Then just install the plugins inside neovim using:
```
:PlugInstall
```
Afterwards, the plugins will install. Afterwards, quit and neovim should be configured.

To use the fixers and linters, you should install the relevant linters + fixers
(see the config file for the relevant ones). Currently, they are hardcoded for
the 10 version of all the tooling.

Key features:
- fzf to search for files fast. This is mapped to Ctrl+F (https://github.com/junegunn/fzf)
- Lightline to make the status bar at the bottom nicer (https://github.com/itchyny/lightline.vim)
- NerdTREE for looking for things within a directory / explore directories fast. This is mapped to Ctrl+O (https://github.com/preservim/nerdtree)
- ALE for linting + formatting of code (customized for C++, CUDA, C & Python) (https://github.com/dense-analysis/ale)
- A default clang-format config (that will be overwritten by a .clang-format
  file)
- LSP support via nvim-lspconfig (requires neovim 0,5v+)
- Treesitter support for better highlighting
- Vimagit to use git better with neovim
- Solarized colorscheme (https://github.com/lifepillar/vim-solarized8)
- A few other nice settings (e.g. mapping tap to 4 spaces, line numbers, etc)

Features I plan on adding:
- Autocomplete
