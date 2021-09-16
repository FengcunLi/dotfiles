#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vim/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/vim/ ~/.vim

# zsh
ln -s ${BASEDIR}/zsh/zshrc ~/.zshrc
#bash
ln -s ${BASEDIR}/bash/inputrc ~/.inputrc

# git
# ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# tmux

ln -s ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf

# FZF
ln -s ${BASEDIR}/fzf/ ~/.fzf

