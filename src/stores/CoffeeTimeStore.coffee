moment = require("moment")
alt = require("../alt")
Color = require("color")
chroma = require("chroma-js")
ct = require("../lib/coffee-time")

gradients = [
  ["#ea3f75","#da56f9"]
  ["#337db9","#50e3c2"]
  ["#3ea8dc","#e587fb"]
]

class CoffeeTimeStore

  constructor: ->
    @hr = ct.getCurrentHourDecimal()
    @calcState()
    @bindListeners
      handleSetHour: CoffeeTimeActions.SET_HOUR
      handleStartTimer: CoffeeTimeActions.START_TIMER
      handleStopTimer: CoffeeTimeActions.STOP_TIMER

  handleSetHour: (hr)->
    @hr = hr
    @calcState()
    return true

  handleStartTimer: ->
    clearInterval(@inveral) if @interval
    @inveral = setInterval @tick, 1000 * 60

  handleStopTimer: ->
    clearInterval(@inveral) if @interval

  tick: =>
    hr = ct.getCurrentHourDecimal()
    @handleSetHour(hr)

  getGradients: ->
    gindex = Math.floor(@hr % gradients.length)
    g1 = gradients[gindex]
    if gindex+1 < gradients.length
      g2 = gradients[gindex + 1]
    else
      g2 = gradients[0]
    return [g1, g2]

  setColors: ->
    [g1, g2] = @getGradients()
    perc = @hr/24
    console.log "perc: #{perc}"
    c1 = chroma.interpolate(g1[0], g2[0], perc).hex()
    console.log "interpolated: ", c1, g1[0], g2[0]
    c2 = chroma.interpolate(g1[1], g2[1], perc).hex()
    @gradient = [c1, c2]


  calcState: ->
    @mood = ct.getMoodScore(@hr)
    @range = ct.getRange(@hr)
    @rangeStart = ct.getNextStartDate(@hr)
    @rangeEnd = ct.getNextEndDate(@hr)
    @inRange = ct.isInRange(@hr)
    minutes = (@hr * 60) - (Math.floor(@hr) * 60)
    @date = moment().hour(@hr).minutes(minutes)
    @setColors()


module.exports = alt.createStore(CoffeeTimeStore, "CoffeeTimeStore")
