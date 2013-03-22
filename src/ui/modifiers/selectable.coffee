class UI.Modifiers.Selectable
  selected: false

  constructor: (view)->
    _.bindAll @, 'render', 'setViewListeners', 'defineMethodsOnView', 'select', 'unSelect',
                 'toggleSelect', 'isSelected', 'handleSelect', 'handleMouseDown', 'handleStageMouseDown'
    @view = view
    @model = @view.model

    @setViewListeners()
    @defineMethodsOnView()

    UI.on 'Select:Selected', @handleSelect

  render: ->
    if @selected
      @previousBorder = @view.$el.css('border')
      @view.$el.css
        'border': '1px dashed #f99'
    else
      @view.$el.css
        'border': 'none'

  setViewListeners: ->
    # this will probably be abstracted out into tools at some point.... maybe
    @view.$el.on 'mousedown', @handleMouseDown
    UI.stage.$el.on 'mousedown', @handleStageMouseDown

  handleSelect: (view)->
    unless view == @view
      @unSelect()

  handleMouseDown: (evt)->
    @select()

  handleStageMouseDown: (evt)->
    if evt.target == UI.stage.el
      @unSelect()

  defineMethodsOnView: ->
    @view.select = @select
    @view.unSelect = @unSelect
    @view.toggleSelect = @toggleSelect
    @view.isSelected = @isSelected

  select: ->
    @selected = true
    @render()
    UI.trigger 'Select:Selected', @view

  unSelect: ->
    @selected = false
    @render()

  toggleSelect: ->
    if @selected
      @unSelect()
    else
      @select()

  isSelected: ->
    @selected
