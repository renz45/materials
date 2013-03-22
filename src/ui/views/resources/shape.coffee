UI.Views.Shape = UI.Views.BaseResource.extend
  tagName: 'div'
  className: 'shape'
  modifiers: [
    'Positionable'
    'Draggable'
    'Recordable'
    'Selectable'
  ]

  initialize: (options = {})->
    _.bindAll @, 'setDefaultModifiers', 'setDefaultStyles', 'render'
    @model = options.model || new UI.Models.Shape
    @setDefaultStyles()

  render: ->
    @$el.css
      'width': @model.get('width')
      'height': @model.get('height')
      'background-color': @model.get('color')
    @el

  setDefaultStyles: ->
    # any default styles can go here