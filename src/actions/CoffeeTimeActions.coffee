alt = require('../alt')

class CoffeeTimeActions

  setHour: (hr)-> @dispatch(hr)
  startTimer:-> @dispatch()
  stopTimer:-> @dispatch()

module.exports = alt.createActions(CoffeeTimeActions)
