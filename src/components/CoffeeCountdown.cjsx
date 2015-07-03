React = require 'react'
EmojiClock = require("./EmojiClock")
moment = require("moment")

CoffeeCountdown = React.createClass

  render: ->
    {rangeStart, mood, rangeEnd, date, range, inRange} = @props
    if not inRange
      label = "Next coffee time starts #{rangeStart.from(date)}"
      rangeLabel = "#{rangeStart.calendar(date)}"
    else
      label = "Ends #{rangeEnd.from(date)}"
      rangeLabel = "#{rangeEnd.calendar(date)}"

    speed = Math.max((1-mood) * 1000, 20)

    <div>
      <EmojiClock speed={1000} />
      <h3 style={styles.label}>{label}<sup>*</sup></h3>
      <p ref="rangeLabel" style={styles.rangeLabel}><sup>*</sup>{rangeLabel}</p>
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
    '@media (max-width: 500px)':
      fontSize: "36px"

  rangeLabel:
    color:"#fff"
    '@media (max-width: 500px)': fontSize: "18px"

module.exports = Radium(CoffeeCountdown)
