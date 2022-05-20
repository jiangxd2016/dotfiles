#!/usr/bin/env bash

# 软连接zplug 默认brew安装的目录
ln -s -f /usr/local/opt/zplug/ $HOME/.zplug/

# 强制生成硬链接，强制覆盖本地源文件
ln -f ./zsh/.zshrc  $HOME/.zshrc
# 让zsh配置生效
source  $HOME/.zshrc
