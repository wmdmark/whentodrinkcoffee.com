React = require 'react'

Emoji = require("./Emoji")

CoffeeQuote = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    quote = "Time for dat coffee!"
    <blockquote>
      <h1 style={styles.header}>
        {quote}
      </h1>
      <Emoji code=":coffee:" />
    </blockquote>

module.exports = CoffeeQuote

styles =
  header:
    display: "inline"
    margin: 0
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
