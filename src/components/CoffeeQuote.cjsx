React = require 'react'

Emoji = require("./Emoji")

CoffeeQuote = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    emoji = null
    if @props.inRange
      quote = "It's coffee time!"
      emoji = <Emoji code=":coffee:" />
    else
      quote = "Uhg, not yet..."
      emoji = <Emoji code=":sad:" />
    <blockquote>
      <h1 style={styles.header}>
        {quote}
      </h1>
      {emoji}
    </blockquote>

module.exports = CoffeeQuote

styles =
  header:
    display: "inline"
    margin: 0
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
