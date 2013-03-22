# Each modifier that has some function of modifying positioning or state of
# an object should respond to a info method. It might be a good idea

class UI.Modifiers.Recordable
  constructor: (view)->
    _.bindAll @, 'record', 'startRecording', 'stopRecording', 'togglePlay', 
                 'handleTick','handleTimerReset'
    UI.on('Timer:Start', @startRecording)
    UI.on('Timer:Stop', @stopRecording)
    UI.on('Timer:Tick', @handleTick)
    UI.on('Timer:Reset', @handleTimerReset)
    UI.on('Record:Play', @togglePlay)
    
    @view = view
    # maybe the timer comes from the start recording event?
    @recording = false
    @recordingData = new UI.Modifiers.Recordable.RecordableData()
    @playing = false
    @playbackIndexCount = 0

  startRecording: (timer)->  
    @recording = true

  handleTimerReset: (timer)->
    @playbackIndexCount = 0
    # play the first tick to reposition the elements on reset
    @playBackRecording(timer.getTime())

  stopRecording: (timer)->
    @recording = false

  handleTick: (timer)->
    if @playing || !@view.isSelected()
      @playBackRecording(timer.getTime())
    else if @recording
      @record(timer.getTime())

  record: (timeStamp)->
    # This knows too much about the view if it's looking for an isSelected method..
    # Need a better way of detecting selected state

    # don't record anything unless the object is selected
    if @view.isSelected && @view.isSelected()
      _.each @view.recordableModifiers, (modifierObject)=>
        @recordingData.push(modifierObject.name, modifierObject.modifier.recordInfo(), timeStamp)

  togglePlay: ->
    if @playing
      @playing = false
    else
      @playing = true

  # play back the record based on the time stamp, this should catch up to a timestamp
  # if the object was paused or falls before. It could probably still be better, but at
  # least we're starting at the last count instead of from the beginning everytime.
  playBackRecording: (timeStamp, options={})->
    _.each @recordingData.playData(), (dataArray, modifierName)=>
      while @playbackIndexCount < dataArray.length && dataArray[@playbackIndexCount].time < timeStamp
        #[{method: 'move', arguments: {x: @x(), y: @y()}}]
        _.each dataArray[@playbackIndexCount].data, (obj)=>
          @view[obj.method].apply(@view, obj.arguments)
        @playbackIndexCount += 1


# class responsible for storing recorded data
class UI.Modifiers.Recordable.RecordableData
  constructor: ->
    @recordingData = {}

  push: (recordingEvent, data, timeStamp)->
    @recordingData[recordingEvent] ||= []
    @recordingData[recordingEvent].push({time: timeStamp, data: data})

  playData: ->
    @recordingData


