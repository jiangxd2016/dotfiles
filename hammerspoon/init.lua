require 'modules.menu'
require 'modules.reload'
require "modules.tiny"
require "modules.git"


-- TODO: hot update git project file
if tableSize(gitfile) == 0 then
 hs.execute('node ./script/git.js',true)
end
