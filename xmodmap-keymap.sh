#!/bin/sh

echo $HOME 
# 清除修饰键绑定
xmodmap -e "clear mod1"       # Alt 的修饰符
xmodmap -e "clear control"    # Control 的修饰符

# 交换键位映射（Alt ↔ Control）
xmodmap -e "keycode 37 = Alt_L"         # 左 Control → 左 Alt
xmodmap -e "keycode 64 = Control_L"     # 左 Alt → 左 Control
xmodmap -e "keycode 105 = Alt_R"        # 右 Control → 右 Alt
xmodmap -e "keycode 108 = Control_R"    # 右 Alt → 右 Control

# 重新绑定修饰符
xmodmap -e "add mod1 = Alt_L Alt_R"     # Alt 的修饰符（原 Control 键）
xmodmap -e "add control = Control_L Control_R"  # Control 的修饰符（原 Alt 键）
# 将 Caps Lock 映射为Escape
xmodmap -e "keycode 66 = Escape"     # Caps Lock → Escape（适合 Vim）

xmodmap -pke > ~/.Xmodmap

# 开机自启动目录 
AUTOSTART_DIR="/home/ziyang/.config/autostart"

# 检查目录是否创建成功
if [ ! -d "$AUTOSTART_DIR" ]; then
  mkdir -p "$AUTOSTART_DIR"
  exit 1
fi

echo "开始创建 mac_keys.desktop 文件..."
cat > "$AUTOSTART_DIR/mac_keys.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Mac Keys
Exec=sh -c "sleep 2 && xmodmap /home/ziyang/.Xmodmap"
EOF

echo "文件创建完成!"

# 验证并提示
echo "键位已调整为 macOS 风格！"
echo "若失效，请运行 'setxkbmap -layout us' 恢复默认。"
