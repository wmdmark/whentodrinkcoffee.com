# Implementation of Nicolas Gallagher's Flexible Cover Image
module.exports = React.createClass
  displayName: 'CoverImage'
  mixins: [Radium.StyleResolverMixin, Radium.BrowserStateMixin]
  getStyles: ->
    styles =
      opacity: 1
      margin: '0 auto 1em'
      maxHeight: '600px'
      maxWidth: '100%'
      backgroundPosition: '50%'
      backgroundRepeat: 'no-repeat'
      backgroundSize: 'cover'
      backgroundImage: "url(#{@props.image})"
      overflow: 'hidden'
      position: 'relative'
      modifiers: [
          {
            ratio:
              '2/1':
                paddingBottom: '50%'
              '3/1':
                paddingBottom: '33.3333%'
              '16/9':
                paddingBottom: '56.25%'
              '4/3':
                paddingBottom: '75%'
          }
        ]
    prefixed = makeStyle
      transition: 'all 500ms linear'
    Object.assign styles, prefixed

  render: ->
    <div {...@getBrowserStateEvents()} style={@buildStyles(@getStyles())}/>