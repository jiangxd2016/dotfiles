# Hammerspoon 
HS_DIR="$HOME/.hammerspoon"

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



