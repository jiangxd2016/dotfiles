
hs.hotkey.bind(Lock.prefix,Lock.key, function()
  hs.caffeinate.lockScreen()
end)


--- 书签存在位置
chromeDir = '/Users/xd/Library/Application Support/Google/Chrome/Default/Bookmarks'
-- hs.sqlite3
--- 历史记录存在位置

-- loadJsonFile(route)
function loadBookMarks()
  local bookMarks =hs.json.read(chromeDir);
  for k, v in pairs(bookMarks) do
    if k == 'roots' then
      for i, j in pairs(v) do
        print(i,j)
         if i == 'bookmark_bar' then
          readBookMarks(j)
         end
        end
      end
    if k == 'version' then
      print("bookMarks version:"..v)
    end
  end  
end

 bookMarkList = {}

  function readBookMarks(bar)
    print("bar",bar)  
      for m, n in pairs(bar) do
        if m == 'children' then
          for o, p in pairs(n) do
            print("-------")
            print(p.name,p.type)
            if p.type == 'url' then
              table.insert(bookMarkList,p)
            elseif p.type == 'folder' then
              readBookMarks(p)
            end
          end
        end
      end
  end   


loadBookMarks()
