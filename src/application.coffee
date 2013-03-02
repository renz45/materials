
############################ Vendor ##################################
# this needs to always be required first in order to auto compile coffeescript files
require('coffee-script')
global.window = window
setAsGlobal("_", require('underscore'))
# jquery doesn't need to be set to a variable like underscore
require './src/vendor/jquery-1.9.1.min.js'
setAsGlobal('$', $)
setAsGlobal('jQuery', jQuery)
setAsGlobal('backbone', require('backbone'))
setAsGlobal('Config', require('./package.json'))


########################## jQuery Plugins ############################
# jquery plugins have to go after setting the global jquery vars
require './src/vendor/jquery.hotkeys.js'

########################## Misc globals ##############################
setAsGlobal("nwGui", require('nw.gui'))
setAsGlobal('nwWindow', nwGui.Window.get())
# toggling this makes the window appear on top but not forced to stay there
nwWindow.setAlwaysOnTop(true)
nwWindow.setAlwaysOnTop(false)

############################## UI ####################################
require './src/ui/ui'