require 'modules.menu'
require 'modules.reload'
require "modules.tiny"
require 'modules.search'
require 'modules.git'
require 'modules.DeepLTranslate'
function setCache()
    hs.execute('sudo node ./cache.js',true)
end
