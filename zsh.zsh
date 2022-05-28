#!/usr/bin/env bash




MY_ZSH="$PWD/zsh"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"


 git submodule update --init --depth 1

# # # # # # # # # # # # # # # # # # #
#  zsh config
# # # # # # # # # # # # # # # # # # # 

# themes
ln -s $PWD/zsh/themes/* $ZSH_CUSTOM/themes
ln -s "$MY_ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# plugins
ln -s $PWD/zsh/plugins/* $ZSH_CUSTOM/plugins


# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrc

# 让zsh配置生效
source  $HOME/.zshrc
