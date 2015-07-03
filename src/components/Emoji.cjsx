React = require 'react'
_ = require("underscore")

Quotes = require("../lib/quotes")

Emoji = React.createClass
  render: ->
    style = styles.emoji
    _.extend style, @props.style if @props.style
    emoji = Quotes.getEmojiByCode(@props.code)
    <div style={style} dangerouslySetInnerHTML={__html: emoji}></div>

styles =
  emoji:
    margin: 0
    display: "block"
    fontSize: "11vw"
    '@media (max-width: 500px)':
      fontSize: "101px"

module.exports = Radium(Emoji)
