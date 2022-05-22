-- 表情包搜索

require 'modules.base'
require 'modules.shortcut'


local screen = hs.window.focusedWindow():screen():frame()

-- 占屏幕宽度的 20%（居中）
local WIDTH = 600
local HEIGHT = 600
local CHOOSER_WIDTH = screen.w * .2
local COORIDNATE_X = screen.w / 2 + CHOOSER_WIDTH / 2 + 5
local COORIDNATE_Y = screen.h / 2 - 600


search_canvas = hs.canvas.new({x = COORIDNATE_X, y = COORIDNATE_Y - HEIGHT / 2, w = WIDTH, h = HEIGHT})


choices = {}
page = 1
appList = {};


local toolId = "app"



chooser = hs.chooser.new(function(choice)
    if not choice then
        return
    end
    local app = hs.application.get(choice.pid);
    print(app:name())
    app:activate()

end)
chooser:width(20)
chooser:rows(10)
chooser:bgDark(false)
chooser:fgColor({
    hex = '#000000'
})
chooser:placeholderText('请输入')


t = require("hs.webview.toolbar")
myConsole = t.new("myConsole", {
        { id = "app",       label="应用", selectable = true, },
        { id = "bookMark",  label="书签", selectable = true,},
        { id = "history",   label="历史",selectable = true, },
        { id = "git",       label="文件夹",selectable = true, },

    })

      myConsole:selectedItem(toolId):notifyOnChange(true):autosaves(true):displayMode("label");
      myConsole:setCallback(function(toolBar, item, name,isSelected)
                toolId=name
                print(toolId)
                    end)


tool_bar =chooser:attachedToolbar(myConsole)


function request(query)

    choices = {}

    query = trim(query)

    if query == '' then
        return
    end


    for _,w in ipairs(hs.window.allWindows()) do
        print('title====> '..w:title())
        if string.find(w:title(),query) == nil then
        else
            print(w:pid())
            table.insert(choices, {
                text = w:title(),
                subText =w:title(),
                path = file_path,
                pid = w:pid()
                })
            chooser:choices(choices)
        end
    end
end



function preview(path)
    if path == nil then
        return
    end
    search_canvas[1] = {
        type = 'image',
        image = hs.image.imageFromPath(path),
        imageScaling = 'scaleProportionally',
        imageAnimates = true
    }
    search_canvas:show()
end

-- 上下键选择
select_key = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    -- 只在 chooser 显示时，才监听键盘按下
    if not chooser:isVisible() then
        return
    end
    local keycode = event:getKeyCode()
    local key = hs.keycodes.map[keycode]
    if 'right' == key then
        page = page + 1
        request(chooser:query())
        return
    end
    if 'left' == key then
        if page <= 1 then
            page = 1
            return
        end
        page = page - 1
        request(chooser:query())
        return
    end
    
    if 'down' ~= key and 'up' ~= key then
        return
    end
    -- TODO-JING 第一项需要直接预览
    number = chooser:selectedRow()
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
    row_contents = chooser:selectedRowContents(number)
    preview(row_contents.path)
end):start()

hs.hotkey.bind(search.prefix,search.key, function()
    page = 1
    chooser:query('')
    chooser:show()
end)

changed_chooser = chooser:queryChangedCallback(function()
    hs.timer.doAfter(0.1, function()
        local query = chooser:query()
        page = 1
        request(query)
    end)
end)

hide_chooser = chooser:hideCallback(function()
    search_canvas:hide(.3)
end)

