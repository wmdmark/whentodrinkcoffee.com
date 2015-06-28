moment = require("moment")
ReactSlider = require("react-slider")

CoffeeTimeStore = require("./stores/CoffeeTimeStore")
CoffeeTimeActions = require("./actions/CoffeeTimeActions")
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

  timeTravel: (e)->
    CoffeeTimeActions.setHour(e.target.value)

  render: ->
    {gradient, mood} = @state
    [gs, ge] = gradient
    gradientStyle =
      background: "linear-gradient(45deg,#{gs},#{ge})"
    containerStyle = _.extend(styles.container, gradientStyle)
    
    console.log 'App.render()'

    <div style={containerStyle}>
      
      <CoffeeQuote {...@state} />
      <CoffeeCountdown {...@state} />
      <footer style={styles.footer}>
        
        <input ref="hour" type="range" value={Math.floor(@state.hr)} min={0} max={24} step={.1} onChange={@timeTravel} />

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
