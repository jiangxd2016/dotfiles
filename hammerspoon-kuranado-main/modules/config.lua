-- 默认加载的功能模块
defaultConfig = {
    {
        -- 配置版本号
        -- 每次新增功能项，需将版本号加 1
        configVersion = "8",
    },
    {
        module = "modules.window",
        name = "窗口管理",
        enable = true,
    },
    {
        module = "modules.application",
        name = "应用切换",
        enable = true,
    },
    {
        module = "modules.emoji",
        name = "表情包搜索",
        enable = true,
    },
    {
        module = "modules.password",
        name = "密码粘贴",
        enable = true,
    },
    {
        module = "modules.input-method",
        name = "输入法切换",
        enable = true,
    },
    {
        module = "modules.im-autoSelect",
        name = "自动输入法",
        enable = true,
    },
    {
        module = "modules.network",
        name = "实时网速",
        enable = true,
    },
    {
        module = "modules.keystroke-visualizer",
        name = "按键回显",
        enable = true,
    },
    {
        module = "modules.wallpaper",
        name = "壁纸切换",
        enable = true,
    },
    {
        module = "modules.hotkey",
        name = "快捷键列表查看",
        enable = true,
    },
    {
        module = "modules.remind",
        name = "提醒下班",
        enable = true,
    },
    {
        module = "modules.update",
        name = "自动检查更新",
        enable = true,
    },
}

base_path = os.getenv("HOME") .. "/.hammerspoon/"
-- 本地配置文件路径
config_path = base_path .. ".config"

-- 加载本地配置文件
function loadConfig()
     config = serialize(defaultConfig)
    return config
end

function saveConfig(config)
    -- 清空文件内容，然后写入新的文件内容
    file = io.open(config_path, "w+")
    file:write(serialize(config))
    file:close()
end
