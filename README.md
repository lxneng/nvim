# NeoVim Config

1. Install NeoVim, https://github.com/neovim/neovim/wiki/Installing-Neovim

2. Configuring NeoVim

```
git clone git@github.com:lxneng/neovim-config.git ~/.vim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/init.vim ~/.vimrc
```

3. alias nvim to vim

```sh
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
```
