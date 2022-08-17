# .dotfiles

Configuration files.

Setup with:

```zsh
git clone --bare https://github.com/wfriesen/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
```

## Plugins

Plugins for vim/zsh are managed as subtrees, with remotes in `$HOME/.dotfiles/config`
All remotes should begin with either `vim-` or `zsh`, and then be added with something like:

```
dotfiles subtree add --prefix .vim/pack/plugins/start/ctrlp.vim vim-ctrlp.vim master --squash
```

Update plugin subtrees with zsh alias `dotfiles-update-remotes`
