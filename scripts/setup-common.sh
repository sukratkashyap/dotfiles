#!/bin/bash

set -e

export ZSH=~/.oh-my-zsh
export ZSH_PLUGINS="${ZSH}/custom/plugins"

if test ! -d "${ZSH}"; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ${ZSH}
fi

mkdir -p "${ZSH_PLUGINS}"
if test ! -d "${ZSH_PLUGINS}/zsh-autosuggestions"; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_PLUGINS}/zsh-autosuggestions
fi

if test ! -d "${ZSH_PLUGINS}/zsh-syntax-highlighting"; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_PLUGINS}/zsh-syntax-highlighting
fi
