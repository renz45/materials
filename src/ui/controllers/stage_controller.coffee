class UI.Controllers.StageController
  constructor: ->
    _.bindAll @, 'startTimer', 'stopTimer', 'resetTimer', 'updateDisplay', 'playRecording'
    @timer = new UI.Modifiers.Timer()
    $('.start').on 'click', @startTimer
    $('.stop').on 'click', @stopTimer
    $('.reset').on 'click', @resetTimer
    $('.play').on 'click', @playRecording
    @timer.on 'tick', @updateDisplay

  startTimer: (evt)->
    @timer.start()

  stopTimer: (evt)->
    @timer.stop()

  resetTimer: (evt)->
    @timer.reset()

  playRecording: (evt)->
    UI.trigger('Record:Play')

  updateDisplay: (timeStamp)->
    $('.timer').text(timeStamp)