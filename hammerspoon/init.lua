require 'modules.menu'
require 'modules.reload'
require "modules.tiny"


   
HYPER = {"cmd", "alt", "ctrl"}
local translate = require('modules.translate')
translate:bindHotkeys({
    translate = { HYPER, "C" },
})
function setCache()
    hs.execute('node ./cache.js',true)
end
