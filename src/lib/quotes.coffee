ct = require("./coffee-time")


quotes =
  coffeeTime: [
    "Ah yeah, time for coffee",
    "So much coffee"
    "Get dat coffee"
    "Moar coffee"
  ]
  notCoffeeTimeQuotes: [
    "Ugh, gotta wait"
    "Not time yet"
    "Nope"
    "\#nope"
    "Not yet"
    "Be patient"
  ]

module.exports =

  getRndQuote: (which)->
    quoteOps = quotes[which]
    _.sample(quoteOps)

  getQuote: (hr)->
    range = ct.getRange(hr)
    mood = ct.getMood(hr)
    inRange = ct.getInRange(hr)

    if inRange:
      return @getRandQuote("coffeeTime")
    else
      return @getRandQuote("notCoffeeTime")
