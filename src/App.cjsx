moment = require("moment")

FacebookButton = require("react-social").FacebookButton
FacebookCount = require("react-social").FacebookCount

CoffeeTimeStore = require("./stores/CoffeeTimeStore")
CoffeeTimeActions = require("./actions/CoffeeTimeActions")
CoffeeQuote = require("./components/CoffeeQuote")
CoffeeCountdown = require("./components/CoffeeCountdown")
TimeSlider = require("./components/TimeSlider")


App = React.createClass
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
    gradientStyle =
      background: "linear-gradient(45deg,#{gradient})"
    containerStyle = _.extend(styles.container, gradientStyle)

    shareURL = "http://whentodrinkcoffee.com"
    shareComponents = <FacebookButton url={shareURL}>
                        <FacebookCount url={shareURL} />
                        Share
                      </FacebookButton>

    <div style={containerStyle}>
      <TimeSlider onChange={this.timeTravel} {...@state}  />
      <CoffeeQuote {...@state} />
      <CoffeeCountdown {...@state} />
      <footer style={styles.footer}>
        The best time to drink coffee based on <a style={styles.link} href="http://en.ilovecoffee.jp/posts/view/110">science.</a><br/>
        Created by <a href="https://twitter.com/wmdmark" style={styles.link}>@wmdmark</a> for <a href="http://blog.pathwright.com/blog/2015/6/30/half-bake-coffee-time-1" style={styles.link}>Pathwright Halfbake</a>.
      </footer>
    </div>

module.exports = Radium(App)

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
    lineHeight: 1.5
    fontSize: 15
  container:
    height: "100%"
    textAlign: "center"
    width: "100%"
    padding: "4vw"
