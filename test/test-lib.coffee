assert = require("assert")
moment = require("moment")

times = require("../src/scripts/lib/coffee-time")

describe "CoffeeTime", ->

  it "can get closest range", ->
    hr = 8 # 8am
    range = times.getClosestRange(hr)
    assert(range.start is 9.5)

    hr = 13 # 1pm
    range = times.getClosestRange(hr)
    assert(range.start is 13.5)

  it "can get current coffee range", ->
    range = times.getCurrentCoffeeRange(10)
    assert(range)
    assert(range.start is 9.5)

  it "can get coffee time score", ->
    score = times.getCoffeeTimeScore(10)
    assert(score > 0 and score < 1)

    # test for perfect peak score
    assert(times.getCoffeeTimeScore(10.5) is 1)
    assert(times.getCoffeeTimeScore(15.25) is 1)

  it "can get mood score", ->
    assert(times.getMoodScore(8) < .5)
    assert(times.getMoodScore(10) > .5)
    
    # peak coffee times
    assert(times.getMoodScore(10.5) is 1) # 10:30 am
    assert(times.getMoodScore(15.25) is 1) # 3:15pm
    
    assert(times.getMoodScore(10.6) < 1)