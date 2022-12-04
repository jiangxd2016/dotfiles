#!/usr/bin/env bash

MY_ZSH="$PWD/zsh"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"


# plugins

if [ ! -d $ZSH_CUSTOM/zsh-syntax-highlighting ]
then
   git clone --depth=1 \
    https://github.com/zsh-users/zsh-syntax-highlighting.git --depth=1 \
     $ZSH_CUSTOM/zsh-syntax-highlighting
fi


if [ ! -d $ZSH_CUSTOM/zsh-syntax-highlighting ]
then
    git clone --depth=1 \
     https://github.com/zsh-users/zsh-autosuggestions.git --depth=1 \
      $ZSH_CUSTOM/zsh-autosuggestions
fi


if [ ! -d $ZSH_CUSTOM/k ]
then
  git clone --depth=1 \
      https://github.com/supercrabtree/k.git --depth=1 \
      $ZSH_CUSTOM/k
fi


if [ ! -d $ZSH_CUSTOM/git-open ]
then
   git clone --depth=1 \
    https://github.com/paulirish/git-open.git --depth=1 \
     $ZSH_CUSTOM/git-open
fi


# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.ideavimrc  $HOME/.ideavimrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrc


# 开启vscode按键重复
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
$ defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default

# 让zsh配置生效
source  $HOME/.zshrc
source  $HOME/.ideavimrc
