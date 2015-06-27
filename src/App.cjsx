gradients = [
  ["#ea3f75","#da56f9"]
  ["#337db9","#50e3c2"]
  ["#3ea8dc","#e587fb"]
]

CoffeeTime = require("./lib/coffee-time")
CoffeeQuote = require("./components/CoffeeQuote")
CoffeeCountdown = require("./components/CoffeeCountdown")

module.exports = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  displayName: 'App'

  getInitialState: ->
    hr = CoffeeTime.getCurrentHourDecimal()
    return mood: CoffeeTime.getMoodScore(hr)

  componentDidMount: ->
    this.timer = setInterval(this.tick, 1000)

  tick: ->
    hr = CoffeeTime.getCurrentHourDecimal()
    this.setState
      mood: CoffeeTime.getMoodScore(hr)

  render: ->
    <div style={styles.container}>
      <CoffeeQuote mood={this.state.mood} />
      <CoffeeCountdown mood={this.state} />
    </div>

gradient = gradients[2]
styles =
  emoji:
    margin: "0px auto"
    display: "block"
    width: 64 + 10
    height: 64 + 10
    padding: 10
    borderRadius: 64+10/2
    backgroundColor: "rgba(255,255,255,.5)"
  container:
    height: "100%"
    width: "100%"
    padding: 40
    background: "linear-gradient(45deg, #{gradient[0]},#{gradient[1]})"
  header:
    margin: 0
    fontFamily: "Roboto, sans-serif"
    fontWeight: 900
    fontSize: "10vw"
    color: "#fff"
