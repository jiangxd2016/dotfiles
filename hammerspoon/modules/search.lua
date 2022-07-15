require 'modules.base'
require 'modules.shortcut'
require "cache.git"
require "cache.bookmarks"

--- hack cache
if (bookmarks == nil) then
    print("[error]: bookmarks is nil,please reload you cache")
    bookmarks = {}
end
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

search_canvas = hs.canvas.new({
    x = COORIDNATE_X,
    y = COORIDNATE_Y - HEIGHT / 3,
    w = WIDTH,
    h = HEIGHT
})

choices = {}
allWindws = {};

SeachUrl = {{
    text = "Goolge",
    url = "https://www.google.com/search?q="
}, {
    text = "Baidu",
    url = "https://www.baidu.com/s?wd="
}, {
    text = "Github",
    url = "https://github.com/search?q="
}, {
    text = "Bing",
    url = "https://www.bing.com/search?q="
}}
toolbar = {{
    id = "search",
    label = "搜索",
    short = "s",
    selectable = true
}, {
    id = "app",
    label = "应用",
    short = "a",
    selectable = true
}, {
    id = "bookMark",
    label = "书签",
    short = "b",
    selectable = true
}, {
    id = "git",
    short = 'g',
    label = "项目",
    selectable = true
}}

searchChooser = hs.chooser.new(function(choice)
    if not choice then
        return
    end
    choice.text = trim(choice.text)

    if toolId == "app" then
        local app = hs.application.get(choice.pid);
        app:activate()
    elseif toolId == "git" then
        print("choice.text==>", choice.text)
        -- 当项目已打开，就直接切换到项目
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
        hs.execute('code ' .. choice.path, true)
    elseif toolId == "bookMark" then
        local default_browser = hs.urlevent.getDefaultHandler('http')
        hs.urlevent.openURLWithBundle(choice.url, default_browser)
    elseif toolId == "search" then
        local default_browser = hs.urlevent.getDefaultHandler('http')
        hs.urlevent.openURLWithBundle(choice.url, default_browser)
    end
end)
searchChooser:width(30)
searchChooser:rows(10)
searchChooser:fgColor({
    hex = '#51c4d3'
})
searchChooser:placeholderText('请输入')

myConsole = hs.webview.toolbar.new("myConsole", toolbar)

myConsole:selectedItem(toolId):notifyOnChange(true):autosaves(true):displayMode("label");

tool_bar = searchChooser:attachedToolbar(myConsole)

function request(query)
    choices = {}
    query = trim(query)
    if query == '' then
        return
    end

    print(toolId)
    if toolId == "app" then
        for _, w in ipairs(allWindows) do
            print('title====> ' .. w:title())
            if string.find(w:title(), query) == nil then
            else
                print(w:pid())
                table.insert(choices, {
                    text = w:title(),
                    subText = w:title(),
                    path = file_path,
                    pid = w:pid()
                })
                searchChooser:choices(choices)
            end
        end
    elseif toolId == "bookMark" then
        for _, w in ipairs(bookmarks) do
            if (string.find(w.name, query) == nil and string.find(w.url, query) == nil) then
            else
                table.insert(choices, {
                    text = w.name,
                    subText = w.url,
                    url = w.url
                })
                searchChooser:choices(choices)
            end
        end
    elseif toolId == "search" then
        for _, w in ipairs(SeachUrl) do
            table.insert(choices, {
                text = w.text,
                subText = w.url,
                url = w.url .. encodeURI(query)
            })
            searchChooser:choices(choices)
        end

    elseif toolId == "git" then
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
    if 'right' == key then
        for v, k in pairs(toolbar) do
            if k.id == toolId then
                if v == #toolbar then
                    print(v)
                    toolId = toolbar[1].id
                else
                    print(v)
                    toolId = toolbar[v + 1].id
                end
                break
            end
        end
        -- 选择
        print(toolId)
        myConsole:selectedItem(toolId)
        request(searchChooser:query())
        return
    end
    if 'left' == key then
        for v, k in pairs(toolbar) do
            if k.id == toolId then
                if v == 1 then
                    toolId = toolbar[#toolbar].id
                else
                    toolId = toolbar[v - 1].id
                end
                break
            end
        end
        -- 选择
        print(toolId)
        myConsole:selectedItem(toolId)
        request(searchChooser:query())
        return
    end

    if 'down' ~= key and 'up' ~= key then
        return
    end
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




hs.hotkey.bind(search.prefix, search.key, function()
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

hide_chooser = searchChooser:hideCallback(function()
    search_canvas:hide(.3)
end)

