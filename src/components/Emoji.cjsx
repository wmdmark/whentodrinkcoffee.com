React = require 'react'
_ = require("underscore")


emojis =
  ":coffee:": "&#9749;"
  ":clock:": "&#128347;"

Emoji = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    style = styles.emoji
    _.extend style, @props.style if @props.style
    emoji = emojis[@props.code]
    <div style={style} dangerouslySetInnerHTML={__html: emoji}></div>

styles =
  emoji:
    margin: 0
    display: "inline-block"
    fontSize: 100
    # border: "1px solid red"
    # display: "inline-block"
    # maxWidth: 64
    # maxHeight: 64

module.exports = Emoji
