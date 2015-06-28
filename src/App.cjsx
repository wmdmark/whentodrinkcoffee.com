moment = require("moment")
CoffeeTimeStore = require("./stores/CoffeeTimeStore")
CoffeeQuote = require("./components/CoffeeQuote")
CoffeeCountdown = require("./components/CoffeeCountdown")

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
    @setState(CoffeeTimeStore.getState())

  tick: ->
    hr = CoffeeTime.getCurrentHourDecimal()
    this.setState
      mood: CoffeeTime.getMoodScore(hr)

  render: ->
    {gradient, mood} = @state
    console.log "App.state: ", @state
    [gs, ge] = gradient
    gradientStyle =
      background: "linear-gradient(45deg,#{gs},#{ge})"
    containerStyle = _.extend(styles.container, gradientStyle)
    console.log "gradientStyle: ", gradientStyle
    <div style={containerStyle}>
      <CoffeeQuote {...@state} />
      <CoffeeCountdown {...@state} />
      <footer style={styles.footer}>
        Created by <a href="https://twitter.com/wmdmark" style={styles.link}>@wmdmark</a> for <a href="https://www.pathwright.com/" style={styles.link}>Pathwright</a> hack/make Friday June 2015.
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
    width: "100%"
    padding: "4vw"
