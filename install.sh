#!/usr/bin/env bash


# Hammerspoon 
HS_DIR="$HOME/.hammerspoon"

MY_ZSH="$PWD/zsh"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"


# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrc

# # # # # # # # # # # # # # # # # # #
#  zsh config
# # # # # # # # # # # # # # # # # # # 

# themes
ln -s $PWD/zsh/themes/* $ZSH_CUSTOM/themes
ln -s "$MY_ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# plugins
ln -s $PWD/zsh/plugins/* $ZSH_CUSTOM/plugins




# # # # # # # # # # # # # # # # # # #
#  hammerspoon config
# # # # # # # # # # # # # # # # # # # 
echo $HS_DIR

# 缓存目录
if [ ! -d $PWD/hammerspoon/cache ]
then
    mkdir $PWD/hammerspoon/cache
    echo bookmarks = {} > ./hammerspoon/cache/bookmarks.lua 
    echo gitfile = {} > ./hammerspoon/cache/git.lua 
fi


if [ ! -d $HS_DIR ]
then
    mkdir -p $HS_DIR
else
    rm -rf $HS_DIR
    mkdir -p $HS_DIR
fi
ln -sf $PWD/hammerspoon/* $HS_DIR




# 让zsh配置生效
source  $HOME/.zshrc
