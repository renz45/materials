require('./shortcut_keys').init()

setAsGlobal 'UI',
  Collections: {}
  Controllers: {}
  Observers: {}
  Modifiers: {}
  Models: {}
  Views:
    Tools: {}
    Resources: {}
    Menu: {}

  init: (options) ->
    $('body').append(UI.stage.render())

  triggerAll: (events, data, context) ->
    if typeof(events) == "string"
      events = [events]
    else

    for event in events
      @.trigger(event, data, context)

  log: (message) ->
    console.log(message)

_.extend(UI, Backbone.Events)

Backbone.$ = $
require('./ui_manifest')

UI.stage = new UI.Views.Stage
UI.init()

# temp object
UI.stage.addChild new UI.Views.Shape
UI.stage.addChild new UI.Views.Shape