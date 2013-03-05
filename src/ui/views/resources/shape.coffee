UI.Views.Shape = Backbone.View.extend
  tagName: 'div'
  className: 'shape'

  initialize: (options = {})->
    _.bindAll @, 'setDefaultModifiers', 'setDefaultStyles', 'render'
    @model = options.model || new UI.Models.Shape
    @setDefaultStyles()
    @setDefaultModifiers()
    @

  render: ->
    @$el.css
      'width': @model.get('width')
      'height': @model.get('height')
      'background-color': @model.get('color')
      'top': @model.get('y')
      'left': @model.get('x')

    @el

  setDefaultStyles: ->
    @$el.css
      'position': 'absolute'
      'border': '1px solid #faa'
      'margin': '0'

  setDefaultModifiers: ->
    new UI.Modifiers.Dragable({view: @, stage: UI.stage})

  position: (options={})->
    if options.x
      @model.set('x', options.x, {silent: true})

    if options.y
      @model.set('y', options.y, {silent: true})

    @render()

  x: (value)->
    @model.set('x', value)

  y: (value)->
    @model.set('y', value)