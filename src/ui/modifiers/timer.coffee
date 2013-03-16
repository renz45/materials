class UI.Modifiers.Timer
  constructor: (view)->
    _.bindAll @, 'start', 'stop', 'tick', 'reset', 'getTime'
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
    UI.trigger('Timer:Reset', @)

  tick: ->
    @totalTime +=1
    UI.trigger('Timer:Tick', @)

  getTime: ->
    @totalTime