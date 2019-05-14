# NeoVim Config

1. Install NeoVim, https://github.com/neovim/neovim/wiki/Installing-Neovim

2. Configuring NeoVim

```
git clone git@github.com:lxneng/nvim.git ~/.config/nvim
```

3. alias nvim to vim

```sh
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
```

## Dockerize

Build from repo.

```
docker build -t nvim .
docker run --rm -it -v $(pwd):/src nvim
alias nvim='docker run --rm -it -v $(pwd):/src nvim'
```

Pull from dockerhub

```
docker pull lxneng/nvim
alias nvim='docker run --rm -it -v $(pwd):/src lxneng/nvim'
```
