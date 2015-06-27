Button = require './components/Button'
CoverImage = require './components/CoverImage'

module.exports = React.createClass
  displayName: 'App'
  render: ->
    <div>
      <section>
        <h1>CJSX File hotloading!!</h1>
        <Button kind='primary'>Primary Button</Button>
        <Button kind='warning'>Warning Button</Button>
      </section>
      <section>
        <CoverImage image="http://placeimg.com/1000/1000/arch" ratio="2/1" />
        <CoverImage image="http://placeimg.com/1000/1000/nature" ratio="3/1"/>
        <CoverImage image="http://placeimg.com/1000/1000/people" ratio="16/9"/>
        <CoverImage image="http://placeimg.com/1000/1000/people" ratio="4/3"/>
      </section>
    </div>