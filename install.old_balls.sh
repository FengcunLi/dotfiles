#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unlinkLink() {
    if [[ -L $2 ]]; then
        unlink $2
        echo "Unlinked $2"
    fi
    ln -s $1 $2
    echo "Linked $2 to $1"
    echo "---------------"
}
# vim
unlinkLink ${BASEDIR}/vim/vimrc ~/.vimrc
unlinkLink ${BASEDIR}/vim/vim/ ~/.vim

# zsh
unlinkLink ${BASEDIR}/zsh/zshrc ~/.zshrc

#bash
unlinkLink ${BASEDIR}/bash/inputrc ~/.inputrc
unlinkLink ${BASEDIR}/bash/git_aliases.sh ~/.git_aliases.sh
if [[ -L ~/.bashrc ]]; then
  unlink ~/.bashrc
fi
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_local_backup
unlinkLink ${BASEDIR}/bash/bashrc ~/.bashrc

# git
# unlinkLink ${BASEDIR}/gitconfig ~/.gitconfig

# tmux

unlinkLink ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf

# FZF
unlinkLink ${BASEDIR}/fzf/ ~/.fzf

# Cmds
unlinkLink ${BASEDIR}/cmds/ ~/.cmds
