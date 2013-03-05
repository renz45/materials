class UI.Modifiers.Dragable
  constructor: (options = {})->
    _.bindAll @, 'startDrag', 'stopDrag', 'updateView', 'initHandlers'
    @view = options.view
    @handle = options.handle || @view.$el
    @stage = options.stage.$el || UI.stage.$el
    @initHandlers()

  initHandlers: ->
    @handle.on 'mousedown', @startDrag
    @handle.on 'mouseup', @stopDrag
    @stage.on 'mouseup', @stopDrag

  startDrag: (evt)->
    evt?.stopPropagation()
    @mouseStartX = evt.clientX
    @mouseStartY = evt.clientY
    @viewStartX = @mouseStartX - evt.offsetX
    @viewStartY = @mouseStartY - evt.offsetY

    @stage.on 'mousemove', @updateView

  stopDrag: (evt)->
    @stage.off 'mousemove'

  updateView: (evt)->
    evt?.stopPropagation()
    totalX = evt.clientX - @mouseStartX - @stage[0].offsetLeft
    totalY = evt.clientY - @mouseStartY - @stage[0].offsetTop
    @view.position
      x: @viewStartX + totalX
      y: @viewStartY + totalY

