#!/usr/bin/env bash

MY_ZSH="$PWD/zsh"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"


# plugins
# 软连接的方式不靠谱，容易网络错误
# ln -sf $PWD/zsh/plugins/* $ZSH_CUSTOM/plugins

if [ ! -d $ZSH_CUSTOM/zsh-syntax-highlighting ]
then
   git clone --depth=1 \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
     $ZSH_CUSTOM/zsh-syntax-highlighting
fi


if [ ! -d $ZSH_CUSTOM/zsh-syntax-highlighting ]
then
    git clone --depth=1 \
     https://github.com/zsh-users/zsh-autosuggestions.git \
      $ZSH_CUSTOM/zsh-autosuggestions
fi


if [ ! -d $ZSH_CUSTOM/k ]
then
  git clone --depth=1 \
      https://github.com/supercrabtree/k.git \
      $ZSH_CUSTOM/k
fi


if [ ! -d $ZSH_CUSTOM/git-open ]
then
   git clone --depth=1 \
    https://github.com/paulirish/git-open.git \
     $ZSH_CUSTOM/git-open
fi


# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.ideavimrc  $HOME/.ideavimrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrc


# 开启按键重复
defaults write -g ApplePressAndHoldEnabled -bool false

# 让zsh配置生效
source  $HOME/.zshrc
source  $HOME/.ideavimrc
