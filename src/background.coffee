Background = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    width: App.width
    height: App.height
    starVelocity: Point.fromAngle(Random.angle())
    stars: []
    x: 0
    y: 0

  # Inherit from game object
  self = GameObject(I)

  STAR_COLORS = [
    "#F00"
    "#0F0"
    "#00F"
    "#FF0"
    "#F0F"
    "#0FF"
    "#FFF"
  ]

  self.bind "create", ->
    50.times ->
      I.stars.push
        x: rand I.width
        y: rand I.height
        color: STAR_COLORS.rand()
        radius: rand()*2 + 1


  self.bind 'update', ->
    I.stars.each (star) ->
      star.x = (star.x + I.starVelocity.x).mod I.width
      star.y = (star.y + I.starVelocity.y).mod I.height

  self.unbind "draw"

  # Add events and methods here
  self.bind "draw", (canvas) ->
    I.stars.each (star) ->
      canvas.drawCircle star

  # We must always return self as the last line
  return self

