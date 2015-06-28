moment = require("moment")
CoffeeTimeStore = require("./stores/CoffeeTimeStore")
CoffeeQuote = require("./components/CoffeeQuote")
CoffeeCountdown = require("./components/CoffeeCountdown")

gradients = [
  ["#ea3f75","#da56f9"]
  ["#337db9","#50e3c2"]
  ["#3ea8dc","#e587fb"]
]


module.exports = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  displayName: 'App'

  getInitialState: ->
    CoffeeTimeStore.getState()

  componentDidMount: ->
    CoffeeTimeStore.listen(@onChange)

  componentWillUnmount: ->
    CoffeeTimeStore.unlisten(@onChange)
  
  onChange: ->
    console.log "CoffeeTimeStore.onChange: ", CoffeeTimeStore.getState()
    @setState(CoffeeTimeStore.getState())

  tick: ->
    hr = CoffeeTime.getCurrentHourDecimal()
    this.setState
      mood: CoffeeTime.getMoodScore(hr)

  render: ->
    <div style={styles.container}>
      <CoffeeQuote {...@state} />
      <CoffeeCountdown {...@state} />
      <footer style={styles.footer}>
        Created by <a href="https://twitter.com/wmdmark" style={styles.link}>@wmdmark</a> for <a href="https://www.pathwright.com/" style={styles.link}>Pathwright</a> hack/make Friday June 2015.
      </footer>
    </div>

gradient = gradients[2]

styles =
  link:
    color: "#fff"
  footer:
    padding: "20px 0px"
    color: "rgba(255,255,255, .6)"
    textAlign: "center"
    position: "absolute"
    bottom: 0
    left: 0
    width: "100%"
  container:
    height: "100%"
    width: "100%"
    padding: 40
    background: "linear-gradient(45deg, #{gradient[0]},#{gradient[1]})"
