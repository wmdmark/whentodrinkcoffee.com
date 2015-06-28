React = require 'react'
EmojiClock = require("./EmojiClock")
moment = require("moment")

CoffeeCountdown = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  render: ->
    {rangeStart, date} = @props
    console.log "rangeStart: ", rangeStart.format()
    console.log "date: ", date.format()
    label = rangeStart.from(date)
    # if date.isBefore(rangeStart)
    #   console.log "TO!"
    #   label = rangeStart.from(date)
    # else
    #   console.log "FROM!"
    #   label = rangeStart.to(date)

    <div>
      <EmojiClock mood={@props.mood} />
      <h3 style={styles.label}>{label}</h3>
      <p style={{color:"#fff"}}>{@props.rangeStart.format()}</p>
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
