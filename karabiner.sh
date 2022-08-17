#!/bin/sh

KAR_DIR="$HOME/.config/karabiner/assets/complex_modifications/"

echo $KAR_DIR
if [ -e $KAR_DIR ]
  ln -sf $PWD/karabiner/* $KAR_DIR
then
    mkdir -p $KAR_DIR
    echo 'karabiner config already exists'
fi
    