

VSCODE_CONFIG_DIR="$PWD/vscode-config"


if [ ! -d $VSCODE_CONFIG_DIR ]
then
    echo $VSCODE_CONFIG_DIR
    mkdir -p $VSCODE_CONFIG_DIR/snippets
fi
echo $VSCODE_USER_DIR
ln -sf ./vscode-config/keybindings.json /Users/xd/Library/Application\ Support/Code/User/ 
ln -sf ./vscode-config/settings.json /Users/xd/Library/Application\ Support/Code/User/ 
ln -sf ./vscode-config/snippets/* /Users/xd/Library/Application\ Support/Code/User/snippets/


