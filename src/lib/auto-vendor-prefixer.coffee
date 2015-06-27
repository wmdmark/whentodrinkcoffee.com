# Auto-vendor-prefixer
# Finds the vendor prefix to use
# MIT license, Author: Wout Mertens

prefix=null
myStyle=document?.head?.style or {}
foundProps={}

newCssProp = (prop) ->
  t = foundProps[prop]
  return t if typeof t isnt 'undefined'
  if prop of myStyle
    foundProps[prop] = prop
    return prop

  PropName = (prop.substr 0, 1).toUpperCase()+prop.substr 1
  if prefix
    t = prefix+PropName
    if t of myStyle
      foundProps[prop]=t
      return t
  else
    for p in ['Webkit', 'Moz', 'ms', 'O']
      t = p+PropName
      if t of myStyle
        prefix = p
        foundProps[prop] = t
        return t

  foundProps[prop]=t
  foundProps[t]=t
  return true

  console.log "Warning: Unknown style property #{prop}"
  foundProps[prop] = prop
  return prop
foundDisplay = {}
fixDisplay = (val) ->
  t = foundDisplay[val]
  return t if typeof t isnt 'undefined'
  if val in ['flex', 'inline-flex']
    for t in [val, "-webkit-#{val}", "-ms-#{val}box"]
      myStyle.display = t
      if myStyle.display is t
        foundDisplay[val] = t
        myStyle.display = ''
        return t

  foundDisplay[val] = val
  return val

if fixDisplay("flex") isnt "flex"
  makeStyle = (style) =>
    s = {}
    for prop, val of style
      if prop is "display"
        s.display = fixDisplay val
      else
        s[newCssProp(prop)] = val

    return s
else
  makeStyle = (style) =>
    s = {}
    for prop, val of style
      s[newCssProp(prop)] = val

    return s

module.exports = makeStyle