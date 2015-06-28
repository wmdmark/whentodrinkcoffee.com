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

  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]

  getInitialState: ->
    clockEmoji: clockStates[0]
    tick: 1

  componentWillMount: ->
    @setSpeed()

  componentWillUnmount: ->
    clearInterval(@interval)

  componentWillUpdate: (nextProps, nextState) ->
    @setSpeed()

  setSpeed: ->
    clearInterval(@interval) if @interval?
    speed = 500 * (1 - @props.mood) + .1
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
    fontSize: 51
    display: "inline-block"


module.exports = EmojiClock
