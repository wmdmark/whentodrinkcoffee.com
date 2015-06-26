require '../../public/styles.css'

React = require 'react'
window.React = React

App = require("./app")

React.render(<App/>, document.body)