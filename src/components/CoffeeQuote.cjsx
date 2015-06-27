React = require 'react'

Emoji = require("./Emoji")

CoffeeQuote = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    quote = "Time for dat coffee!"
    <h1 style={styles.header}>{quote} <Emoji name="coffee" /></h1>

module.exports = CoffeeQuote

styles =
  header:
    margin: 0
    fontFamily: "Roboto, sans-serif"
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
