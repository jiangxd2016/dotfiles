require 'modules.base'
require 'modules.shortcut'
require "cache.git"


if (gitfile == nil) then
    print("[error]: gitfile is nil,please reload you cache")
    gitfile = {}
end

local screen = hs.window.focusedWindow():screen():frame()

-- 占屏幕宽度的 20%（居中）
local WIDTH = 600
local HEIGHT = 600
local CHOOSER_WIDTH = screen.w * .3
local COORIDNATE_X = screen.w / 3 + CHOOSER_WIDTH / 3 + 5
local COORIDNATE_Y = screen.h / 3 - 800
local toolId = "search"

choices = {}
allWindws = {};

searchChooser = hs.chooser.new(function(choice)
    if not choice then
        return
    end
    choice.text = trim(choice.text)
    for _, w in ipairs(allWindows) do
        print("w.title==>", w:title())
        if string.find(w:title(), choice.text) == nil then
        else
            print("find--------------------")
            local app = hs.application.get(w.pid);
            app:activate()
            return
        end
    end
end)
searchChooser:width(30)
searchChooser:rows(10)
searchChooser:fgColor({
    hex = '#51c4d3'
})
searchChooser:placeholderText('请输入')


function request(query)
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
            searchChooser:choices(choices)
        end
    end
end

-- 上下键选择
select_key = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    -- 只在 searchChooser 显示时，才监听键盘按下
    if not searchChooser:isVisible() then
        return
    end
    local len = 0;
    local keycode = event:getKeyCode()
    local key = hs.keycodes.map[keycode]
    number = searchChooser:selectedRow();
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
    row_contents = searchChooser:selectedRowContents(number)
end):start()




hs.hotkey.bind(git.prefix, git.key, function()
    allWindows = hs.window.allWindows();
    searchChooser:query('')
    searchChooser:show()
end)

changed_chooser = searchChooser:queryChangedCallback(function()
    hs.timer.doAfter(0.1, function()
        local query = searchChooser:query();
        print(query)
        request(query)
    end)
end)

