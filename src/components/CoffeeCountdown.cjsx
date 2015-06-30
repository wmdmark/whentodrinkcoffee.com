React = require 'react'
EmojiClock = require("./EmojiClock")
moment = require("moment")

CoffeeCountdown = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  render: ->
    {rangeStart, mood, rangeEnd, date, range, inRange} = @props
    if not inRange
      label = "Next coffee time starts #{rangeStart.from(date)}"
      rangeLabel = "#{rangeStart.calendar(date)}"
    else
      label = "Ends #{rangeEnd.from(date)}"
      rangeLabel = "#{rangeEnd.calendar(date)}"

    speed = Math.max((1-mood) * 1000, 20)
    if mood > .5
      exclaims = mood - .5 * 10
      label = "#{label}#{('!' for i in [0..exclaims]).join('')}"

    <div>
      <EmojiClock speed={speed} />
      <h3 style={styles.label}>{label}<sup>*</sup></h3>
      <p style={styles.rangeLabel}><sup>*</sup>{rangeLabel}</p>
    </div>

styles =
  label:
    margin: 0
    marginLeft: 10,
    display: "inline-block"
    fontSize: "4vw"
    color: "#fff"
    fontWeight: 100
    verticalAlign: "middle"
    position: "relative"
    top: -2
  rangeLabel:
    color:"#fff"
    fontSize: "2vw"

module.exports = CoffeeCountdown
