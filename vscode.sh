#!/bin/sh

VSCODE_CONFIG_DIR="$PWD/vscode-config"

# function to detect OS type
detect_os() {
    local uname_out="$(uname -s)"
    local os_type=""

    # check os type from uname
    case "$uname_out" in
        Linux*)     os_type="Linux";;
        Darwin*)    os_type="Mac";;
        CYGWIN*|MINGW*|MSYS*) os_type="Windows";;
        *)          os_type="Unknown: $uname_out";;
    esac

    # check is windows from path
    if [ "$os_type" = "Unknown: $uname_out" ]; then
        if [ "$OS" = "Windows_NT" ]; then
            os_type="Windows"
        elif [ -d "/windows" ]; then
            os_type="Windows"
        fi
    fi

    echo $os_type
}

# echo OS type
os_type=$(detect_os)
echo "Detected OS: $os_type"

# check if vscode snippets directory exists
if [ ! -d "$VSCODE_CONFIG_DIR" ]; then
    echo "Creating VSCode config directory..."
    mkdir -p "$VSCODE_CONFIG_DIR/snippets"
fi

# setup VSCode keybindings and settings
if [ "$os_type" = "Mac" ]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
    VSCODE_KEYBINDINGS_FILE="$VSCODE_CONFIG_DIR/keybindings.json"
    VSCODE_SETTINGS_FILE="$VSCODE_CONFIG_DIR/settings.json"
elif [ "$os_type" = "Windows" ]; then
    VSCODE_USER_DIR="$HOME/AppData/Roaming/Code/User"
    VSCODE_KEYBINDINGS_FILE="$VSCODE_CONFIG_DIR/keybindings-windows.json"
    VSCODE_SETTINGS_FILE="$VSCODE_CONFIG_DIR/settings-windows.json"
else
    echo "Unsupported OS. Skipping symlink creation."
    exit 1
fi


echo $VSCODE_SETTINGS_FILE
echo "VSCode user directory: $VSCODE_USER_DIR"

# create symlinks
ln -sf "$VSCODE_KEYBINDINGS_FILE" "$VSCODE_USER_DIR/keybindings.json"
ln -sf "$VSCODE_SETTINGS_FILE" "$VSCODE_USER_DIR/settings.json"

# create snippets files symlinks
for file in "$VSCODE_CONFIG_DIR"/snippets/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        ln -sf "$file" "$VSCODE_USER_DIR/snippets/$filename"
    fi
done
echo "Symlinks created successfully."

####### im-select installation #########
# if im-select already exist, delete it and copy it again
if [ "$os_type" = "Mac" ]; then
    if [ -e /usr/local/bin/im-select ]; then
        rm -f /usr/local/bin/im-select
    fi

    echo "* Copy im-select..."

    cp ./im-select /usr/local/bin/im-select

    chmod 755 /usr/local/bin/im-select

    echo "* im-select is installed!"
    echo "* now run \"im-select\" in your terminal!"
elif [ "$os_type" = "Windows" ]; then
# need have D:\ drive
    if [ -e "D:\\iim-select.exe" ]; then
        rm -f "D:\\iim-select.exe"
    fi

    echo "* Copy im-select..."

    cp ./im-select.exe "D:\\im-select.exe"

    chmod 755 "D:\\iim-select.exe"

    echo "* im-select is installed!"
    echo "* now run \"im-select\" in your terminal!"
fi
