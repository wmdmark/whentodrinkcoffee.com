React = require 'react'

Quotes = require("../lib/quotes")

Emoji = require("./Emoji")

CoffeeQuote = React.createClass
 
  setDocTitle: (emojiCode)->
    emoji  = Quotes.getEmojiByCode(emojiCode)
    # HACK alert
    if @props.inRange
      thumb = Quotes.getEmojiByCode(":thumbs_up:")
    else
      thumb = Quotes.getEmojiByCode(":thumbs_down:")
    document.querySelector('title').innerHTML = emoji + thumb
    #document.title =  emoji + thumb

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

module.exports = Radium(CoffeeQuote)

styles =
  header:
    display: "inline"
    margin: 0
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
    '@media (max-width: 500px)':
      fontSize: "64px"
