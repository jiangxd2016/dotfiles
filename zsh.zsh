#!/usr/bin/env bash




MY_ZSH="$PWD/zsh"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"


 git submodule update --init --depth 1

# # # # # # # # # # # # # # # # # # #
#  zsh config
# # # # # # # # # # # # # # # # # # # 
brew install starship

# plugins
ln -s $PWD/zsh/plugins/* $ZSH_CUSTOM/plugins


# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.ideavimrc  $HOME/.ideavimrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrc


# 开启按键重复
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false         # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default


# 让zsh配置生效
source  $HOME/.zshrc
