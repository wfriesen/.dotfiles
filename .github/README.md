# .dotfiles

Configuration files.

Install:

- bash
- zsh
- tmux

Setup with:

```zsh
git clone --bare https://github.com/wfriesen/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
```

## Plugins

Plugins for vim/zsh are managed as subtrees, with remotes in `$HOME/.dotfiles/config`
All remote names should begin with either `vim-` or `zsh-`. Directory name containing plugin code should match remote name, with vim-/zsh- prefix removed.

Add a new subtree with something like:

```
dotfiles subtree add --prefix .vim/pack/plugins/start/undotree vim-undotree master --squash
```

Update plugin subtrees with zsh alias `dotfiles-update-remotes`
