gradients = [
  ["#ea3f75","#da56f9"]
  ["#337db9","#50e3c2"]
  ["#3ea8dc","#e587fb"]
  ["#337db9","#50e3c2"]
]

module.exports = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  displayName: 'App'

  render: ->
    <div style={styles.container}>
      <h1 style={styles.header}>This is the heading that is long</h1>
    </div>

gradient = gradients[0]
styles =
  container:
    height: "100%"
    width: "100%"
    padding: 10
    background: "linear-gradient(45deg, #{gradient[0]},#{gradient[1]})"
  header:
    margin: 0
    fontFamily: "Roboto, sans-serif"
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
