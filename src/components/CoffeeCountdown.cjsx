React = require 'react'
EmojiClock = require("./EmojiClock")
moment = require("moment")

CoffeeCountdown = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  render: ->
    label = @props.rangeStart.from(@props.date)
    <div>
      <EmojiClock mood={@props.mood} />
      <h3 style={styles.label}>{label}</h3>
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
