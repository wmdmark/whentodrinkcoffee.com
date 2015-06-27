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
    fontSize: "5vw"
    color: "#fff"

module.exports = CoffeeCountdown
