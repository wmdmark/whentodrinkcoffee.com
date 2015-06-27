React = require 'react'

Emoji = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    className = 'em em-' + this.props.name
    <i className={className} style={styles.emoji} />

styles =
  emoji:
    display: "inline-block"
    width: 64
    height: 64

module.exports = Emoji
