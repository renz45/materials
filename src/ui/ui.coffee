$('html').on 'keydown.meta_shift_c', (evt)->
  nwWindow.showDevTools()

$('html').on 'keydown.meta_r', (evt)->
  nwWindow.reload()

$('html').on 'keydown.meta_shift_r', (evt)->
  nwWindow.reloadIgnoringCache()