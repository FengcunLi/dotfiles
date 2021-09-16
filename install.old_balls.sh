#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unlinkLink() {
    if [[ -L $2 ]]; then
        unlink $2
        echo "Unlinked $2"
    fi
    ln -s $1 $2
    echo "Linked $2 to $1"
}
# vim
unlinkLink -s ${BASEDIR}/vim/vimrc ~/.vimrc
unlinkLink -s ${BASEDIR}/vim/vim/ ~/.vim

# zsh
unlinkLink -s ${BASEDIR}/zsh/zshrc ~/.zshrc

#bash
unlinkLink -s ${BASEDIR}/bash/inputrc ~/.inputrc
if [[ -L ~/.bashrc ]]; then
  unlink ~/.bashrc
fi
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_local_backup
unlinkLink -s ${BASEDIR}/bash/bashrc ~/.bashrc

# git
# unlinkLink -s ${BASEDIR}/gitconfig ~/.gitconfig

# tmux

unlinkLink -s ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf

# FZF
unlinkLink -s ${BASEDIR}/fzf/ ~/.fzf
