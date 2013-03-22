# This modifier relies on the view having a move method that execepts an object 
# with keys: 'x' and 'y'. This can be defined manually or by including the positionable modifier
class UI.Modifiers.Draggable
  constructor: (view)->
    _.bindAll @, 'startDrag', 'stopDrag', 'updateView', 'initHandlers', 'checkApis'
    @view = view
    @handle = @view.handle || @view.$el

    # this might change to a parent object eventually and be referenced through the view
    @stage = UI.stage.$el

    @checkApis()
    @initHandlers()

  initHandlers: ->
    @handle.on 'mousedown', @startDrag
    @handle.on 'mouseup', @stopDrag
    @stage.on 'mouseup', @stopDrag

  checkApis: ->
    unless @view.move?.constructor == Function
      console.log("The draggable modifer requires that the view has a move() method. Add the positionable modifier or define the move() method")

  startDrag: (evt)->
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
    @view.move
      x: @viewStartX + totalX
      y: @viewStartY + totalY

