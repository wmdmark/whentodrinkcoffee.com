React = require 'react'
EmojiClock = require("./EmojiClock")

CoffeeCountdown = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    <div>
      <EmojiClock mood={this.props.mood} />
      <h3 style={styles.label}>Time until label here</h3>
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
