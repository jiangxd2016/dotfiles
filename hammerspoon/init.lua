require 'modules.menu'
require 'modules.reload'
require "modules.tiny"

function setCache()
    hs.execute('node ./cache.js',true)
end
