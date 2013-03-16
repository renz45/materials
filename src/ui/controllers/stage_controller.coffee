class UI.Controllers.StageController
  constructor: ->
    _.bindAll @, 'startTimer', 'stopTimer', 'resetTimer', 'updateDisplay', 'playRecording'

    UI.timer = new UI.Modifiers.Timer()
    $('.start').on 'click', @startTimer
    $('.stop').on 'click', @stopTimer
    $('.reset').on 'click', @resetTimer
    $('.play').on 'click', @playRecording
    UI.on 'Timer:Tick', @updateDisplay

  startTimer: (evt)->
    UI.timer.start()

  stopTimer: (evt)->
    UI.timer.stop()

  resetTimer: (evt)->
    UI.timer.reset()
    @updateDisplay(UI.timer)

  playRecording: (evt)->
    UI.trigger('Record:Play')

  updateDisplay: (timer)->
    $('.timer').text(timer.getTime())