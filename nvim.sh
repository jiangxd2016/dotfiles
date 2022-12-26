  #!/bin/sh
  #!/bin/sh
NVIM_DIR="$HOME/.config/"

echo $NVIM_DIR
echo $PWD


rm -rf $NVIM_DIR/nvim
mkdir -p $NVIM_DIR

cp -R $PWD/nvim $NVIM_DIR

