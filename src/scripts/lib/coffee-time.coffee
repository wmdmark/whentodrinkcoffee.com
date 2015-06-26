moment = require("moment")
_ = require("underscore")

coffeeTimes = [
  {start: 9.5, end: 11.5} # 9:30 - 11:30
  {start: 13.5, end: 17} # 1:30 - 5:00, half=3:15 (15 + 15/60)
]
maxDiffHours = 2

module.exports = 
  
  getCurrentHourDecimal: ->
    moment().hours() + moment().minutes()/60

  getMoodScore: (hr)->
    # :returns: 0 - 1 based mood score based on proximity
    # to peak coffee time!
    currentRange = @getCurrentCoffeeRange(hr)
    if currentRange
      # Inside range: score based on closeness to peak
      score = 0.5

      timeScore = @getCoffeeTimeScore(hr) - score
      if timeScore > 0
        score = score + timeScore
    else
      # Outside range: score based on closeness to range
      range = @getClosestRange(hr)
      distance = Math.abs(range.start - hr)
      if distance > maxDiffHours
        score = 0 # too far away!
      else
        score = 1 - distance/maxDiffHours

    return score

  getClosestRange: (hr)->
    validRanges = _.filter coffeeTimes, (range)-> range.start >= hr
    if not validRanges
      # circle around
      return coffeeTimes[0]
    else
      return validRanges[0]

  isOutsideRange: (hr)->
    !@getCurrentCoffeeRange(hr)

  getCurrentCoffeeRange: (hr)->
    range = _.find coffeeTimes, (range)-> hr >= range.start and hr < range.end
    range

  getCoffeeTimeScore: (hr)->
    # returns a number0
    score = 0
    range = @getCurrentCoffeeRange(hr)
    if range
      rangeSpan = range.end - range.start
      hrRelative = hr - range.start
      percThrough = hrRelative / rangeSpan
      score = 1 - Math.abs(percThrough - .5)
    score