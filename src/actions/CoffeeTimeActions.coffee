alt = require('../alt')

class CoffeeTimeActions

  setHour: (hr)-> @dispatch(hr)

module.exports = alt.createActions(CoffeeTimeActions)

