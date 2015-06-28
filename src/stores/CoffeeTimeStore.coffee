moment = require("moment")
alt = require("../alt")

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

  handleSetHour: (hr)->
    @hr = hr
    @calcState()
    return true

  calcState: ->
    @mood = ct.getMoodScore(@hr)
    # TODO: filter by mood
    @gradient = gradients[0]
    @range = ct.getRange(@hr)
    @rangeStart = ct.getNextStartDate(@hr)
    @rangeEnd = ct.getNextEndDate(@hr)
    @inRange = ct.isInRange(@hr)
    minutes = (@hr * 60) - (Math.floor(@hr) * 60)
    @date = moment().hour(@hr).minutes(minutes)


module.exports = alt.createStore(CoffeeTimeStore, "CoffeeTimeStore")