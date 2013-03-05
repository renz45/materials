class StageController
  initialize: ->
    UI.stage.on 'Shape:Drag:Start', @initStopDrag

  initStopDrag: (dragable)->
    UI.stage.on 'mouseup', ->
      dragable.stopDrag()