require 'modules.base'
require 'modules.shortcut'
require "cache.git"


if (gitfile == nil) then
    print("[error]: gitfile is nil,please reload you cache")
    gitfile = {}
end

local choices = {}

local gitChooser = hs.chooser.new(function(choice)
    if not choice then
        return
    end
    choice.text = trim(choice.text)
    print("choice.text==>", choice.text)
    -- 当项目已打开，就直接切换到项目
    for _, w in ipairs(allWindows) do
        if string.find(w:title(), choice.text) == nil then
        else
            local appName = w:pid()
            local app = hs.application.get(appName);
            app:activate()
            return
        end
    end
    local command = "open -a \"Visual Studio Code\" " .. choice.path
    hs.execute(command)
end)
gitChooser:width(30)
gitChooser:rows(10)
gitChooser:fgColor({
    hex = '#51c4d3'
})
gitChooser:placeholderText('请输入')


local function request(query)
    choices = {}
    query = trim(query)
    if query == '' then
        return
    end

    print(toolId)
    for _, w in ipairs(gitfile) do
        if string.find(w.name, query) == nil then
        else
            table.insert(choices, {
                text = w.name,
                subText = w.name,
                path = w.path
            })
            gitChooser:choices(choices)
        end
    end
end

-- 上下键选择
local select_key = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    -- 只在 gitChooser 显示时，才监听键盘按下
    if not gitChooser:isVisible() then
        return
    end
    local len = 0;
    local keycode = event:getKeyCode()
    local key = hs.keycodes.map[keycode]
    number = gitChooser:selectedRow();
    print(number, len)
    if 'down' == key then
        if number < len then
            number = number + 1
        else
            number = 1
        end
    end
    if 'up' == key then
        if number > 1 then
            number = number - 1
        else
            number = len
        end
    end
    row_contents = gitChooser:selectedRowContents(number)
end):start()




hs.hotkey.bind(git.prefix, git.key, function()
    print("git dialog open event")
    allWindows = hs.window.allWindows();
    gitChooser:query('')
    gitChooser:show()
end)

local changed_chooser = gitChooser:queryChangedCallback(function()
    hs.timer.doAfter(0.1, function()
        local query = gitChooser:query();
        print(query)
        request(query)
    end)
end)

