class UI.Modifiers.Timer
  constructor: (view)->
    _.bindAll @, 'start', 'stop', 'tick', 'reset'
    _.extend(@, Backbone.Events)

    @view = view
    @totalTime = 0
    @timer = ""

  start: ->
    UI.trigger 'Timer:Start', @
    clearInterval(@timer)
    # this is the main timer for now, ticking at 50ms
    @timer = setInterval(@tick, 50)

  stop: ->
    UI.trigger 'Timer:Stop', @
    clearInterval(@timer)

  reset: ->
    @stop
    @totalTime = 0
    @.trigger('tick', @totalTime)

  tick: ->
    @totalTime +=1
    @.trigger('tick', @totalTime)