#!/usr/bin/env bash

# zplug目录
ZP_DIR="/usr/local/opt/zplug"
# Hammerspoon 工作目录
HS_DIR="$HOME/.hammerspoon"

# 没有zplug目录，则安装zplug
if [ ! -d $ZP_DIR ]
then
    echo "zplug not found,start install"
    brew install zplug
fi

# 生成软链接
ln -sf $PWD/zsh/.zshrc  $HOME/.zshrc
ln -sf $PWD/zsh/.vsvimrc  $HOME/.vsvimrctest


ln -s $PWD/hammerspoon/* $HS_DIRtest
# 让zsh配置生效
source  $HOME/.zshrc
