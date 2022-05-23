-- 表情包搜索

require 'modules.base'
require 'modules.shortcut'
require "modules.git"
require "modules.tiny"

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


 SeachUrl ={
    {
        text="Goolge",
        url="https://www.google.com/search?q=",
    },
    {
        text="Baidu",
        url="https://www.baidu.com/s?wd=",
    },
    {
        text="Github",
        url="https://github.com/search?q=",
    },
    {
        text="Bing",
        url="https://www.bing.com/search?q=",
    }
}

local toolId = "search"


chooser = hs.chooser.new(function(choice)
    if not choice then
        return
    end
    if toolId == "app" then
        local app = hs.application.get(choice.pid);
        print(app:name())
        app:activate()
    elseif toolId == "git" then
        hs.execute('code '..choice.path,true)
    elseif toolId == "bookMark" then
        local default_browser = hs.urlevent.getDefaultHandler('http')
        hs.urlevent.openURLWithBundle(choice.url, default_browser)
    elseif toolId == "search" then
        local default_browser = hs.urlevent.getDefaultHandler('http')
        hs.urlevent.openURLWithBundle(choice.url, default_browser)    
    end 
end)
chooser:width(20)
chooser:rows(10)
chooser:fgColor({
    hex = '#84CC16'
})
chooser:placeholderText('请输入')


myConsole = hs.webview.toolbar.new("myConsole", {
        { id = "app",       label="应用", selectable = true, },
        { id = "bookMark",  label="书签", selectable = true,},
        { id = "search",   label="搜索",selectable = true, },
        { id = "git",       label="文件夹",selectable = true, },
    })

myConsole:selectedItem(toolId):notifyOnChange(true):autosaves(true):displayMode("label");
myConsole:setCallback(function(toolBar, item, name,isSelected)
                toolId=name
                print(toolId)
                    end)


tool_bar = chooser:attachedToolbar(myConsole)


function request(query)
    choices = {}
    query = trim(query)
    if query == '' then
        return
    end

    print(toolId)
    if toolId == "app" then
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
    elseif toolId == "bookMark" then
        for _,w in ipairs(bookMarkList) do
            print('title====> ',w.name,w.url)
            if (string.find(w.name,query) == nil and string.find(w.url,query) == nil) then
            else
                table.insert(choices, {
                    text = w.name,
                    subText =w.url,
                    url = w.url,
                    })
                chooser:choices(choices)
            end
        end
    elseif toolId == "search" then
        for _,w in ipairs(SeachUrl) do
            print('title====> ',w.text,w.url)
                table.insert(choices, {
                    text = w.text,
                    subText =w.url,
                    url = w.url..query,
                    })
                chooser:choices(choices)
        end   
        
    elseif toolId == "git" then
        print(gitfile)
        for _,w in ipairs(gitfile) do
            print(w.name,w.path)
            if string.find(w.name,query) == nil then
            else
                table.insert(choices, {
                    text = w.name,
                    subText =w.name,
                    path = w.path
                    })
                chooser:choices(choices)
            end
        end
    end    
end




-- 上下键选择
select_key = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    -- 只在 chooser 显示时，才监听键盘按下
    if not chooser:isVisible() then
        return
    end
    local len = 0;
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
    number = chooser:selectedRow();
    print(number,len)
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

