# Assign React to Window so the Chrome React Dev Tools will work.
React = require 'react'

App = React.createClass
  render: ->
    <div>
      <h1>DAMN, IT TIME 4 COFFEE!</h1>
      <p>Is this working?</p>
    </div>

module.exports = App
