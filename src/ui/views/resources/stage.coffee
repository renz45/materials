UI.Views.Stage = Backbone.View.extend
  tagName: 'div'
  className: 'stage'

  initialize: (options = {})->
    @model = options.model || new UI.Models.Stage
    @collection = options.collection || new UI.Collections.StageCollection
    @setDefaultStyles()

    @

  render: ->
    @$el.css
      'width': @model.get('width')
      'height': @model.get('height')
      'background-color': @model.get('color')
    @el

  setDefaultStyles: ->
    @$el.css
      'position': 'absolute'
      'border': '1px solid #afa'

  addChild: (child)->
    @$el.append child.render()