-- git 项目读取的文件夹
local findDir = "Documents"

-- 书签位置
local chromeDir = 'Library/Application Support/Google/Chrome/Default/'

local USER_HOME = os.getenv("HOME") or os.getenv("USERPROFILE")
local dir = USER_HOME .. "/" .. findDir
local outDir = os.getenv("HOME") ..  "./.cache"
local BookmarksFilePath = USER_HOME .. "/" .. chromeDir .. "Bookmarks"



function readFileList(dir)
  local filesList = {}
  local files = lfs.dir(dir)
  for item in files do
    if item ~= "." and item ~= ".." and item ~= "node_modules" then
      local fullPath = dir .. "/" .. item
      local attr = lfs.attributes(fullPath)
      if attr.mode == "directory" then
        -- only read one level
        if isGitSync(fullPath) then
          table.insert(filesList, {name = item, path = fullPath})
        else
          local subFilesList = readFileList(fullPath) --递归读取文件
          for _, subItem in ipairs(subFilesList) do
            table.insert(filesList, subItem)
          end
        end
      end
    end
  end
  return filesList
end

function loadBookMarks()
  local file = io.open(BookmarksFilePath, "r")
  local bookmarks = file:read("*all")
  file:close()
  local bookmarksList = json.decode(bookmarks)
  local bookmark_bar = bookmarksList.roots.bookmark_bar
  return readBookMarks(bookmark_bar)
end

function readBookMarks(bar)
  local bookMarKList = {}
  if type(bar) == "table" then
    for _, item in ipairs(bar) do
      if item.url then
        table.insert(bookMarKList, item)
      end
      if item.children then
        local subBookMarKList = readBookMarks(item.children)
        for _, subItem in ipairs(subBookMarKList) do
          table.insert(bookMarKList, subItem)
        end
      end
    end
  elseif bar.children then
    for _, item in ipairs(bar.children) do
      if item.type == "url" then
        table.insert(bookMarKList, item)
      else
        local subBookMarKList = readBookMarks(item)
        for _, subItem in ipairs(subBookMarKList) do
          table.insert(bookMarKList, subItem)
        end
      end
    end
  end
  return bookMarKList
end

function setGitLuaFile()
  local filesList = readFileList(dir)
  local str = {"gitfile = {"}
  for _, item in ipairs(filesList) do
    table.insert(str, string.format('{name="%s",path="%s"},', item.name, item.path))
  end
  table.insert(str, "}")
  local file = io.open(outDir .. "/git.lua", "w")
  file:write(table.concat(str, "\n"))
  file:close()
end

function setBookMarksLuaFile()
  local bookMarKList = loadBookMarks()
  local str = {"bookmarks = {"}
  for _, item in ipairs(bookMarKList) do
    table.insert(str, string.format('{name="%s",url="%s"},', item.name, item.url))
  end
  table.insert(str, "}")
  local file = io.open(outDir .. "/bookmarks.lua", "w")
  file:write(table.concat(str, "\n"))
  file:close()
end

setGitLuaFile()
setBookMarksLuaFile()
