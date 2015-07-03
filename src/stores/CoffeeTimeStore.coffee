moment = require("moment")
alt = require("../alt")
ct = require("../lib/coffee-time")

gradients = [
  ["#ea3f75","#da56f9"]
  ["#337db9","#50e3c2"]
  ["#3ea8dc","#e587fb"]
]

# Based off of http://codepen.io/zessx/pen/rDEAl/
skyGradients = [
  "#00000c"
  "#020111 85%,#191621 100%"
  "#020111 60%,#20202c 100%"
  "#020111 10%,#3a3a52 100%"
  "#20202c 0%,#515175 100%"
  "#40405c 0%,#6f71aa 80%,#8a76ab 100%"
  "#4a4969 0%,#7072ab 50%,#cd82a0 100%"
  "#757abf 0%,#8583be 60%,#eab0d1 100%"
  "#82addb 0%,#ebb2b1 100%"
  "#94c5f8 1%,#a6e6ff 70%,#b1b5ea 100%"
  "#b7eaff 0%,#94dfff 100%"
  "#9be2fe 0%,#67d1fb 100%"
  "#90dffe 0%,#38a3d1 100%"
  "#57c1eb 0%,#246fa8 100%"
  "#2d91c2 0%,#1e528e 100%"
  "#2473ab 0%,#1e528e 70%,#5b7983 100%"
  "#1e528e 0%,#265889 50%,#9da671 100%"
  "#1e528e 0%,#728a7c 50%,#e9ce5d 100%"
  "#154277 0%,#576e71 30%,#e1c45e 70%,#b26339 100%"
  "#2F1107 100%"
  "#071B26 0%,#071B26 30%,#8A3B12 80%,#240E03 100%"
  "#010A10 30%,#59230B 80%,#2F1107 100%"
  "#090401 50%,#4B1D06 100%"
  "#00000c 80%,#150800 100%"
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
    @inveral = setInterval(@tick, 1000 * 60)

  handleStopTimer: ->
    clearInterval(@inveral) if @interval

  tick: =>
    hr = ct.getCurrentHourDecimal()
    CoffeeTimeActions.setHour(hr)

  getSkyGradient: ->
    if not @inRange
      skyGradients[Math.floor(@hr)]
    else
      _.sample(gradients).join(",")

  getGradients: ->
    gindex = Math.floor(@hr % gradients.length)
    g1 = gradients[gindex]
    if gindex+1 < gradients.length
      g2 = gradients[gindex + 1]
    else
      g2 = gradients[0]
    return [g1, g2]

  setColors: ->
    @gradient = @getSkyGradient()

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
