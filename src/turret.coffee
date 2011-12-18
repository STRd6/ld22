turretTop = Sprite.loadByName "turretTop"

Turret = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "placeholder"
    width: 32

  # Inherit from game object
  self = Base(I)

  # Add events and methods here
  self.bind "update", ->
    ; # Add update method behavior
    # Shoot sometimes

  self.bind "draw", (canvas) ->
    direction = Point.direction(I, playerData)
    canvas.withTransform Matrix.rotation(direction), ->
      turretTop.draw(canvas, 0, 0)

  # We must always return self as the last line
  return self

