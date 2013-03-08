UI.Views.BaseResource = Backbone.View.extend
  constructor: ->
    _.bindAll @, 'setDefaultModifiers'
    Backbone.View.prototype.constructor.call(this, arguments)

    # call the default constructor first so the view is setup
    # then setup the modifier when we have a el to work with
    @setDefaultModifiers()

  setDefaultModifiers: ->
    @recordableModifiers = []
    _.each @modifiers, (modifier)=>
      @[modifier] = new UI.Modifiers[modifier](@)
      if @[modifier].recordInfo && @[modifier].recordInfo.constructor == Function
        @recordableModifiers.push({name: modifier, modifier: @[modifier]})

