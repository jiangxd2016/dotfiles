#!/usr/bin/env bash
# 强制生成硬链接，强制覆盖本地源文件
ln -f ./zsh/.zshrc  $HOME/.zshrc
# 让zsh配置生效
source  $HOME/.zshrc
