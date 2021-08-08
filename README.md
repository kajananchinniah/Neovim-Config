# Vim-Config

This repo serves to backup my vim config file. My config is fairly minimalist right now as I'm starting over from scratch, but I'm hoping to add more features (should I find it necessary). I'm planning on adding a neovim config file (probably will be the same thing) later but I haven't used neovim too much yet. The installation for neovim should be straight forward (similar to vim). 

## Installation
Get Vim Plug (https://github.com/junegunn/vim-plug)

Vim: 
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

NeoVim: 
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Afterwards, simply copy and paste the .vimrc file into your .vimrc file and install inside vim using:
```
:PlugInstall
```

Afterwards, the plugins will install. Afterwards, quit and vim should be configured.

Key features:
- fzf to search for files fast. This is mapped to Ctrl+F (https://github.com/junegunn/fzf)
- Lightline to make the status bar at the bottom nicer (https://github.com/itchyny/lightline.vim)
- NerdTREE for looking for things within a directory / explore directories fast. This is mapped to Ctrl+O (https://github.com/preservim/nerdtree)
- ALE for linting + formatting of code (customized for C++, CUDA, C & Python) (https://github.com/dense-analysis/ale)
- Solarized colorscheme (https://github.com/lifepillar/vim-solarized8)
- A few other nice settings (e.g. mapping tap to 2 spaces, line numbers, etc)
