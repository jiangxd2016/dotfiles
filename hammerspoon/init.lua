require 'modules.menu'
require 'modules.reload'
require "modules.tiny"

function setCache()
    hs.execute('sudo node ./cache.js',true)
end
