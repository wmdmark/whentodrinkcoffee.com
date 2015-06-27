Button = require './components/Button'
CoverImage = require './components/CoverImage'

module.exports = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  displayName: 'App'

  render: ->
    <div style={styles.container}>
      <h1 style={styles.header}>This is the heading that is long</h1>
    </div>

styles =
  container:
    height: "100%"
    width: "100%"
    padding: 10
    background: "linear-gradient(45deg,red,yellow)"
  header:
    margin: 0
    fontFamily: "Roboto, sans-serif"
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
