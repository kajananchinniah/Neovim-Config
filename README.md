# Neovim-Config

This repo serves to backup my neovim config file. I ended up making this public
again for convenience.

## Installation

First install Neovim. For Ubuntu, run the following:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install -y neovim
```

Next, get Vim Plug (https://github.com/junegunn/vim-plug) by running the following:
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Afterwards, make a `nvim` directory under `~/.config/` and copy and paste the `init.vim` file from this repository into `~/.config/nvim/init.vim`.

Now install the plugins inside Neovim by opening `init.vim` with `nvim` and using
```
:PlugInstall
```
Afterwards, quit and Neovim should be configured.

Vim support is likely indentical but I haven't tested it on Vim (I have a few
Neovim specific plugins for LSP, treesitter and autocompletion support)

To use the fixers and linters, you should install the relevant linters and fixers
(see the config file for the relevant ones). You also will need to install any
LSPs that you want. For Python, use pip3 to install the following: pyright,
flake8, pylint, pylama, autoflake, autoimport, black, and isort.

## Key Features
- fzf to search for files fast
- Lightline to make the status bar at the bottom nicer
- NerdTREE for looking for things within a directory / explore directories fast
- ALE for linting and formatting of code (customized for C++, CUDA, C & Python)
- A default clang-format config (that will be overwritten by a .clang-format
  file)
- LSP support via nvim-lspconfig (requires Neovim 0.5v+)
- Treesitter support for better highlighting
- Vimagit to use git better
- Solarized colourscheme
- Autocomplete via nvim-cmp
- A few other nice settings (e.g. mapping tap to 4 spaces, line numbers, etc)

For specifics about the bindings, see `init.vim`.

## TODO
- Refactor to lua to clean things up (I temporarily made the repo private to do
  this but I procrastinated)
