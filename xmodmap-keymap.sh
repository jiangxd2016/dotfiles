##
#!/bin/bash

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
# 将 Caps Lock 映射为 Control 或 Escape（解除注释生效）
xmodmap -e "keycode 66 = Escape"     # Caps Lock → Escape（适合 Vim）

# 可选：禁用 Caps Lock
# xmodmap -e "keycode 66 = NoSymbol"

# 验证并提示
echo "键位已调整为 macOS 风格！"
echo "若失效，请运行 'setxkbmap -layout us' 恢复默认。"
