UI.Views.Stage = Backbone.View.extend
  tagName: 'div'
  className: 'stage'
  children: []

  initialize: (options = {})->
    @model = options.model || new UI.Models.Stage()
    @collection = options.collection || new UI.Collections.StageCollection()
    @controller = new UI.Controllers.StageController()
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

  addChild: (childView)->
    @children.push(childView)
    @$el.append childView.render()