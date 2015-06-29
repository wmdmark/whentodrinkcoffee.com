React = require 'react'

Quotes = require("../lib/quotes")

Emoji = require("./Emoji")

CoffeeQuote = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  setDocTitle: (emojiCode)->
    emoji  = Quotes.getEmojiByCode(emojiCode)
    # HACK alert
    if @props.inRange 
      thumb = Quotes.getEmojiByCode(":thumbs_up:")
    else 
      thumb = Quotes.getEmojiByCode(":thumbs_down:")
    document.title =  emoji + thumb

  render: ->
    emojiCode = Quotes.getEmoji(@props.hr)
    quote = Quotes.getQuote(@props.hr)
    @setDocTitle(emojiCode)
    <blockquote>
      <Emoji code={emojiCode} />
      <h1 style={styles.header}>
        {quote}
      </h1>
    </blockquote>

module.exports = CoffeeQuote

styles =
  header:
    display: "inline"
    margin: 0
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
