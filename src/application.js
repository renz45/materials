path = require('path')
oldRequire = window.require

# Shim require to always resolve an absolute path to files starting with '/' or './'
window.require = (filePath)->
  if filePath[0] == '/' || filePath.slice(0,2) == "./"
    filePath = arguments[0]
    arguments[0] = path.resolve(filePath)
  oldRequire.apply(this, arguments)

# this needs to always be required first in order to auto compile coffeescript files
require('coffee-script')
window._ = require('./src/vendor/underscore')
# jquery doesn't need to be set to a variable like underscore
require('./src/vendor/jquery-1.9.1.min.js')
window.test = require('./src/test')
