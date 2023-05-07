

VSCODE_CONFIG_DIR="$PWD/vscode"


if [ ! -d $VSCODE_CONFIG_DIR ]
then
    echo $VSCODE_CONFIG_DIR
    mkdir -p $VSCODE_CONFIG_DIR/snippets
fi
echo $VSCODE_USER_DIR
ln -sf /Users/xd/Library/Application\ Support/Code/User/keybindings.json ./vscode
ln -sf /Users/xd/Library/Application\ Support/Code/User/settings.json ./vscode
ln -sf /Users/xd/Library/Application\ Support/Code/User/snippets/* ./vscode/snippets


