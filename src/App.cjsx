moment = require("moment")
ReactSlider = require("react-slider")

CoffeeTimeStore = require("./stores/CoffeeTimeStore")
CoffeeTimeActions = require("./actions/CoffeeTimeActions")
CoffeeQuote = require("./components/CoffeeQuote")
CoffeeCountdown = require("./components/CoffeeCountdown")
TimeSlider = require("./components/TimeSlider")

module.exports = React.createClass
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  displayName: 'App'

  getInitialState: ->
    CoffeeTimeStore.getState()

  componentDidMount: ->
    CoffeeTimeStore.listen(@onChange)
    CoffeeTimeActions.startTimer()

  componentWillUnmount: ->
    CoffeeTimeStore.unlisten(@onChange)

  onChange: ->
    @setState(CoffeeTimeStore.getState())

  timeTravel: (value)->
    CoffeeTimeActions.setHour(value)

  render: ->
    {gradient, mood} = @state
    [gs, ge] = gradient
    gradientStyle =
      background: "linear-gradient(45deg,#{gs},#{ge})"
    containerStyle = _.extend(styles.container, gradientStyle)

    <div style={containerStyle}>
      <TimeSlider onChange={this.timeTravel} {...@state}  />
      <CoffeeQuote {...@state} />
      <CoffeeCountdown {...@state} />
      <footer style={styles.footer}>

        The best time to drink coffee based on <a style={styles.link} href="http://en.ilovecoffee.jp/posts/view/110">science.</a><br/>
        Created by <a href="https://twitter.com/wmdmark" style={styles.link}>@wmdmark</a> for <a href="https://www.pathwright.com/" style={styles.link}>Pathwright</a> Halfbake June 2015.
      </footer>
    </div>

styles =
  link:
    color: "#fff"
  footer:
    padding: "20px"
    color: "rgba(255,255,255, .6)"
    textAlign: "center"
    position: "absolute"
    bottom: 0
    left: 0
    width: "100%"
  container:
    height: "100%"
    textAlign: "center"
    width: "100%"
    padding: "4vw"
    WebkitTransition: "background 10s ease-out"
    transition: "background 10s ease-out"
