#!/bin/bash

# 定义自动启动目录和文件名
AUTOSTART_DIR="$HOME/.config/autostart"
DESKTOP_FILE="$AUTOSTART_DIR/fcitx5.desktop"

# 创建目录（如果不存在）
mkdir -p "$AUTOSTART_DIR"

# 写入 .desktop 文件内容
cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Type=Application
Name=Fcitx5
Exec=fcitx5 -d
Terminal=false
EOF

# 设置文件权限
chmod +x "$DESKTOP_FILE"

# 输出结果
echo "已创建自动启动配置：$DESKTOP_FILE"
