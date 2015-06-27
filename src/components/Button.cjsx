module.exports = React.createClass
  displayName: 'Button'
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  render: ->
    textColor = '#444'
    backgroundColor = '#aaa'
    styles =
      padding: '1em'
      border: 0
      borderRadius: 0
      color: textColor
      backgroundColor: backgroundColor
      fontSize: 16
      fontWeight: 600
      margin: 3
      cursor: 'pointer'

      states: [
        {
          hover:
            computed:
              backgroundColor: (styles) ->
               color(styles.backgroundColor).lighten(0.2).hexString()
        },
        {
          focus:
            boxShadow: '0 0 0 3px #0074D9'
            outline: 'none'
        }
      ]

      modifiers: [
        {
          kind:
            primary: { backgroundColor: 'aqua'}
            warning: { backgroundColor: 'tomato'}
        }
      ]

    <button {...@getBrowserStateEvents()} style={@buildStyles(styles)}>
      {@props.children}
    </button>
