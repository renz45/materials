# Each modifier that has some function of modifying positioning or state of
# an object should respond to a info method. It might be a good idea

class UI.Modifiers.Recordable
  constructor: (view)->
    _.bindAll @, 'record', 'startRecording', 'stopRecording', 'togglePlay', 'handleTick'
    UI.on 'Timer:Start', @startRecording
    UI.on 'Timer:Stop', @stopRecording
    UI.on 'Record:Play', @togglePlay
    
    @view = view
    # maybe the timer comes from the start recording event?
    @recording = false
    @recordingData = new UI.Modifiers.Recordable.RecordableData()
    @playing = false

  startRecording: (timer)->
    @timer = timer
    @recordingData.timer = timer
    @timer.on('tick', @handleTick)
    @recording = true

  stopRecording: (timer)->
    @recording = false

  handleTick: (timeStamp)->
    if @playing
      @playBackRecording(timeStamp)
    else
      @record(timeStamp)

  record: (timeStamp)->
    _.each @view.recordableModifiers, (modifierObject)=>
      @recordingData.push(modifierObject.name, modifierObject.modifier.recordInfo(), timeStamp)

  togglePlay: ->
    if @playing
      @playing = false
    else
      @playing = true

  # this is sort of a proof of concept, the while loop is really
  # f-ing slow and the streams are getting crossed somwhere
  # with more then one object on the screen
  # also, the stored data needs to be deleted for the selected object or modified
  # when the timer is reset.
  playBackRecording: (timeStamp)->
    _.each @recordingData.playData(), (dataArray, modifierName)=>
      count = 0
      while dataArray[count].time < timeStamp
        #[{method: 'move', arguments: {x: @x(), y: @y()}}]
        _.each dataArray[count].data, (obj)=>
          @view[obj.method](obj.arguments)
        count += 1
        if count >= dataArray.length - 1
          break


# class responsible for storing recorded data
class UI.Modifiers.Recordable.RecordableData
  constructor: ->
    @timer = null
    @recordingData = {}

  push: (recordingEvent, data, timeStamp)->
    @recordingData[recordingEvent] ||= []
    @recordingData[recordingEvent].push({time: timeStamp, data: data})

  playData: ->
    @recordingData


