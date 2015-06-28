React = require 'react'
EmojiClock = require("./EmojiClock")
moment = require("moment")

CoffeeCountdown = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  render: ->
    {rangeStart, rangeEnd, date, range, inRange} = @props
    if not inRange
      label = "Next coffee time starts #{rangeStart.from(date)}"
    else
      label = "Ends #{rangeEnd.from(date)}"

    rangeLabel = "#{rangeStart.format()} - #{rangeEnd.format()}"

    <div>
      <EmojiClock mood={@props.mood} />
      <h3 style={styles.label}>{label}</h3>
      <p style={{color:"#fff"}}>{rangeLabel}</p>
    </div>

styles =
  label:
    margin: 0
    display: "inline-block"
    fontSize: "5vw"
    color: "#fff"
    fontFamily: "Roboto, sans-serif"
    fontWeight: 100


module.exports = CoffeeCountdown
