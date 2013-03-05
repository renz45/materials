UI.Models.Shape = Backbone.Model.extend
  initialize: ->
    @set('x', '0')
    @set('y', '0')
    @set('width', "100")
    @set('height', "100")
    @set('index', "0")
    @set('opacity', "1")
    @set('color', '#aaa')