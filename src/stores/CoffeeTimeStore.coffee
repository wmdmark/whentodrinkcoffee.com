moment = require("moment")
alt = require("../alt")

ct = require("../lib/coffee-time")

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
    @range = ct.getRange(@hr)
    @rangeStart = ct.getNextStartDate(@hr)
    @rangeEnd = ct.getNextEndDate(@hr)
    @inRange = ct.isInRange()
    minutes = (@hr * 60) - (Math.floor(@hr) * 60)
    @date = moment().hour(@hr).minutes(minutes)

module.exports = alt.createStore(CoffeeTimeStore, "CoffeeTimeStore")