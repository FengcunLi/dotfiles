#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vim/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/vim/ ~/.vim

# zsh
ln -s ${BASEDIR}/zsh/zshrc ~/.zshrc

# git
# ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# tmux

# ln -s ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf
