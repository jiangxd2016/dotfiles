require 'modules.menu'
require 'modules.reload'
require "modules.tiny"
require "modules.system"


function setCache()
    hs.execute('node ./cache.js',true)
end



-- StatMenu = hs.menubar.new()
-- CpuTitle = "init"
-- local statMenuInterval = 3
-- FontStyle = {  size = 12 }
-- breakStyle  = { font = FontStyle }
-- -- show cpu usage in menu bar
-- local function getCpuTitle()
-- 	local cpuUsage = hs.host.cpuUsage()
-- 	local activeUsage = cpuUsage.overall.active
-- 	local fmt = string.format("%.2f%% ", activeUsage)
-- 	local styled = hs.styledtext.new(fmt, { font = FontStyle })
-- 	local styledIcon = hs.styledtext.new("CPU", { font = FontStyle })
-- 	return styled .. styledIcon
-- end


-- local function getSeparator()
--     return hs.styledtext.new("-----------------\n", breakStyle)
--   end
     

-- local function getVmStats()

--     local returnText = hs.styledtext.new("", {})
--     returnText = returnText:__concat(getSeparator())
  
--     local vmStats = hs.host.vmStat()
  
--     local vmHeader = hs.styledtext.new("VM Stats: \n",breakStyle)
--     returnText = returnText:__concat(vmHeader)
--     returnText = returnText:__concat(getSeparator())
  
--     --1024^2
--     local megDiv = 1048576
--     local megMulti = vmStats.pageSize / megDiv
  
  
--     -- Mem Used:
--     -- Wired Memory: -> Pages wired down
--     -- Compressed: -> Pages occupied by compressor
--     -- App Memory: -> Pages Active + Pages Speculative
--     --http://apple.stackexchange.com/questions/81581/why-does-free-active-inactive-speculative-wired-not-equal-total-ram
--     local megsUsed =  vmStats.pagesWiredDown * megMulti
--     megsUsed = megsUsed + vmStats.pagesUsedByVMCompressor * megMulti
--     megsUsed = megsUsed + vmStats.pagesActive * megMulti
--     megsUsed = megsUsed + vmStats.pagesSpeculative * megMulti
  
--     local totalMegs = vmStats.memSize / megDiv
--     local freeMegs = totalMegs - megsUsed
  
--     local megsCached = vmStats.fileBackedPages * megMulti
  
--     local vmBodyText =         "In Use: " .. string.format("%.f", megsUsed) .. "M - ".. string.format("%.f", megsUsed / totalMegs * 100) .. "%\n"
--     vmBodyText = vmBodyText .. "Free  : " .. string.format("%.f", freeMegs) .. "M - ".. string.format("%.f", freeMegs / totalMegs * 100) .. "%\n"
--     vmBodyText = vmBodyText .. "Total : " .. string.format("%.f", totalMegs) .. "M\n"
--     vmBodyText = vmBodyText .. "Cached: " .. string.format("%.f", megsCached) .. "M\n"
--     local vmBody = hs.styledtext.new(vmBodyText, breakStyle)
--     returnText = returnText:__concat(vmBody)
--     print(returnText)
--     return returnText
--   end

-- local function refreshStats()
-- 	CpuTitle = getCpuTitle()
--     VmInfo = getVmStats()
--     print(VmInfo)
--     StatMenu:setTitle(VmInfo)
-- 	StatMenu:setTitle(CpuTitle)
-- end

-- refreshStats()
-- StatMenuTimer = hs.timer.new(statMenuInterval, refreshStats)
-- StatMenuTimer:start()
