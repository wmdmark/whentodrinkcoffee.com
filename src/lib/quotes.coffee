ct = require("./coffee-time")

emojiMap =
  ":coffee:": "☕️"
  ":thumbs_up:": "👍"
  ":thumbs_down:": "👎"
  ":happy:": "😃"
  ":happy_heart:": "😍"
  ":savour:": "😋"
  ":cool_happy:": "😎"

  ":sadder:": "😭"
  ":sad:": "😢"
  ":scream:": "😱"
  ":weary:": "😩"

quotes =
  coffeeTime: [
    "Ah yeah, coffee time",
    "So much coffee"
    "Get dat coffee"
    "Moar coffee"
    "#coffeetime"
  ]
  notCoffeeTime: [
    "Ugh, gotta wait"
    "Not time yet"
    "Nope"
    "#nope"
    "Not yet"
    "Be patient"
  ]

emojis =
  coffeeTime: [
    ":happy:"
    ":happy_heart:"
    ":savour:"
    ":cool_happy:"
  ]
  notCoffeeTime: [
    ":sad:"
    ":sadder:"
    ":scream:"
    ":weary:"
  ]

module.exports =

  getEmojiByCode: (code)->
    emojiMap[code]

  getRandQuote: (which)->
    quoteOps = quotes[which]
    quote = _.sample(quoteOps)
    quote

  getQuote: (hr)->
    mood = ct.getMoodScore(hr)
    inRange = ct.isInRange(hr)
    if inRange
      return @getRandQuote("coffeeTime")
    else
      return @getRandQuote("notCoffeeTime")

  getRandEmoji: (which)->
    ops = emojis[which]
    _.sample(ops)

  getEmoji: (hr)->
    mood = ct.getMoodScore(hr)
    inRange = ct.isInRange(hr)
    if inRange
      return @getRandEmoji("coffeeTime")
    else
      return @getRandEmoji("notCoffeeTime")
