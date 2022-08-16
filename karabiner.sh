#!/bin/sh

KAR_DIR="$HOME/.config/karabiner/assets/complex_modifications"
if [ -d KAR_DIR ]
  ln -sf $PWD/karabiner/* $KAR_DIR
then
    mkdir -p $KAR_DIR
    echo 'karabiner config already exists'
fi
    