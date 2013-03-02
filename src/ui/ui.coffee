require('./shortcut_keys').init()
require('./ui_manifest')

setAsGlobal "UI",
  Collections: {}
  Controllers: {}
  Observers: {}
  Models: {}
  Views:
    Tools: {}
    Resources: {}
    Menu: {}

  init: (options) ->
    @Router = new UI.Router(@settings)
    _.extend(@, Backbone.Events)
    @Router.start()

  triggerAll: (events, data, context) ->
    if typeof(events) == "string"
      events = [events]
    else

    for event in events
      @.trigger(event, data, context)

  log: (message) ->
    console.log(message)