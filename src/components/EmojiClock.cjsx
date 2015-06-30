React = require 'react'

clockStates = [ "&#128347;",
                "&#128336;",
                "&#128337;",
                "&#128338;",
                "&#128339;",
                "&#128340;",
                "&#128341;",
                "&#128342;",
                "&#128343;",
                "&#128344;",
                "&#128345;",
                "&#128346;"]

EmojiClock = React.createClass

  getInitialState: ->
    clockEmoji: clockStates[0]
    tick: 1

  componentWillMount: -> @setSpeed(@props.speed)
  componentWillUnmount: -> clearInterval(@interval)
  componentWillReceiveProps: (nextProps) -> @setSpeed(nextProps.speed)

  setSpeed: (speed)->
    clearInterval(@interval) if @interval
    @interval = setInterval(this.doTick, speed)

  doTick: ->
    tick = this.state.tick + 1
    if tick >= clockStates.length - 1
      tick = 0
    this.setState
      clockEmoji: clockStates[tick]
      tick: tick

  render: ->
    <div dangerouslySetInnerHTML={__html: this.state.clockEmoji} style={styles.emoji}></div>

styles =
  emoji:
    fontSize: "3.5vw"
    display: "inline-block"
    verticalAlign: "middle"
    '@media (max-width: 500px)':
      fontSize: "36px"



module.exports = Radium(EmojiClock)
