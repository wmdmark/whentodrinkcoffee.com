React = require('react')

Slider = React.createClass

  render: ->
    <input
      type="range"
      value={this.props.value}
      min={this.props.min}
      max={this.props.max}
      onInput={this.props.handleChange}
      step={this.props.step} />

module.exports = Slider