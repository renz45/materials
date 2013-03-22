class UI.Modifiers.Positionable
  constructor: (view)->
    _.bindAll @, 'move', 'x', 'y', 'render', 'setDefaultStyles', 'defineMethodsOnView', 'recordInfo'
    @view = view
    @model = @view.model

    @setDefaultStyles()
    @defineMethodsOnView()

  render: ->
    @view.$el.css
      'top': @model.get('y')
      'left': @model.get('x')

  setDefaultStyles: ->
    @view.$el.css
      'position': 'absolute'
      'top': 0
      'left': 0

  # api for interacting with the recordable modifier
  recordInfo: ->
    [{method: 'move', arguments: [{x: @x(), y: @y()}]}]

  defineMethodsOnView: ->
    @view.move = @move
    @view.x = @x
    @view.y = @y

  move: (options={})->
    if options.x
      @x(options.x, {silent: true})
    if options.y
      @y(options.y, {silent: true})
    @render()

  x: (value, options={})->
    if value
      @model.set('x', value, options)
    else
      @model.get('x')

  y: (value, options={})->
    if value
      @model.set('y', value)
    else
      @model.get('y')

