-- 此文件为示例文件，用户请勿修改，如需自定义快捷键，请修改 shortcut.lua 文件，如不存在 shortcut.lua 文件，则执行命令 cp shortcut.lua.example shortcut.lua 创建一份即可
-- 快捷键配置版本号
shortcut_config = {
    version = 1.0
}
hyperOpt = {"Ctrl", "Option"}
hyperOptCmd = {"Ctrl", "Option", "Command"}

-- prefix：表示快捷键前缀，可选值：Ctrl、Option、Command
-- key：可选值 [A-Z]、[1-9]、Left、Right、Up、Down、-、=、/
-- message 表示提示信息

-- 窗口管理快捷键配置
windows = {
    -- 左半屏
    left = {prefix = hyperOpt, key = "Left", message = "Left Half"},
    -- 右半屏
    right = {prefix = hyperOpt, key = "Right", message = "Right Half"},
    -- 上半屏
    up = {prefix = hyperOpt, key = "Up", message = "Up Half"},
    -- 下半屏
    down = {prefix = hyperOpt, key = "Down", message = "Down Half"},
    -- 左
    win_left = {prefix = hyperOpt, key = "H", message = "Top Left"},
    -- 右
    win_right = {prefix = hyperOpt, key = "L", message = "Top Right"},
    -- 下
    win_bottom = {prefix = hyperOpt, key = "J", message = "Left Bottom"},
    -- 上
    win_top= {prefix = hyperOpt, key = "K", message = "Right Bottom"},

    -- 居中
    center = {prefix = hyperOpt, key = "C", message = "Center"},
    -- 等比例放大窗口
    zoom = {prefix = hyperOpt, key = "=", message = "Zoom Window"},
    -- 等比例缩小窗口
    narrow = {prefix = hyperOpt, key = "-", message = "Narrow Window"},
    -- 最大化
    max = {prefix = hyperOpt, key = "Return", message = "Max Window"},
    -- 将窗口移动到上方屏幕
    to_up = {prefix = hyperOptCmd, key = "Up", message = "Move To Up Screen"},
    -- 将窗口移动到下方屏幕
    to_down = {prefix = hyperOptCmd, key = "Down", message = "Move To Down Screen"},
    -- 将窗口移动到左侧屏幕
    to_left = {prefix = hyperOptCmd, key = "Left", message = "Move To Left Screen"},
    -- 将窗口移动到右侧屏幕
    to_right = {prefix = hyperOptCmd, key = "Right", message = "Move To Right Screen"}
}

-- 应用切换快捷键配置
applications = {
    {prefix = {"Option"}, key = "Q", message="QQ", bundleId="com.tencent.qq"},
    {prefix = {"Option"}, key = "W", message="WeChat", bundleId="com.tencent.xinWeChat"},
    {prefix = {"Option"}, key = "V", message="VSCode", bundleId="com.microsoft.VSCode"},
    {prefix = {"Option"}, key = "F", message="Finder", bundleId="com.apple.finder"},
    {prefix = {"Option"}, key = "C", message="Chrome", bundleId="com.google.Chrome"},
    {prefix = {"Option"}, key = "J", message="IntelliJ IDEA", bundleId="com.jetbrains.intellij"},
    {prefix = {"Option"}, key = "D", message="DataGrip", bundleId="com.jetbrains.datagrip"},
    -- {prefix = {"Option"}, key = "P", message="Postman", bundleId="com.postmanlabs.mac"},
    {prefix = {"Option"}, key = "O", message="Word", bundleId="com.microsoft.Word"},
    {prefix = {"Option"}, key = "E", message="Excel", bundleId="com.microsoft.Excel"},
    {prefix = {"Option"}, key = "S", message="SourceTree", bundleId="com.torusknot.SourceTreeNotMAS"},
    {prefix = {"Option"}, key = "T", message="Terminal", bundleId="com.apple.Terminal"},
    {prefix = {"Option"}, key = "M", message="QQMusic", bundleId="com.tencent.QQMusicMac"}
}


color ={
    prefix = {
        "Option"
    },
    key = "H",
}


-- 搜索快捷键配置
search = {
    prefix = {
        "Option"
    },
    key = "K"
}


Lock = {
    prefix = {
        "Option"
    },
    key = "L"
}


-- 快捷键查看面板快捷键配置
hotkey = {
    prefix = {
        "Option"
    },
    key = "/"
}
