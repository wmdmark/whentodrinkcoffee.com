React = require 'react'

TimeSlider = React.createClass

  onChange: (e)->
    val = e.target.value
    @props.onChange?(val)

  render: ->
    <div style={{position: "absolute", top: 10, right: 10}}>
      <div style={styles.timer}>{@props.date.format("hh:mm A")}</div>
      <input ref="hour" type="range" value={@props.hr} min={0} max={24} step={.001} onChange={this.onChange} />
    </div>


styles =
  timer:
    padding: 5
    backgroundColor: "rgba(0,0,0,.5)"
    color: "#fff"
    fontWeight: 900

module.exports = TimeSlider
