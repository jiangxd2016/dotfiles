#!/bin/bash

# Hammerspoon 工作目录
WORKING_DIR="$HOME/.hammerspoon"

# 工作目录不存在
if [ ! -d "$WORKING_DIR" ]
then
  mkdir "$WORKING_DIR"
fi

echo "目标目录：$WORKING_DIR"


# 安装 Hammerspoon

/bin/cp -rf ./hammerspoon/* "$WORKING_DIR"
