require 'modules.menu'
require 'modules.reload'
require "modules.tiny"
-- require "modules.translate"
function setCache()
    hs.execute('node ./cache.js',true)
end
