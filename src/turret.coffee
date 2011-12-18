turretTop = Sprite.loadByName "turret_top"

Turret = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "placeholder"
    width: 32

  # Inherit from game object
  self = Box(I)

  shoot = ->
    engine.add
      class: "Bullet"
      x: I.x
      y: I.y
      velocity: Point.fromAngle(I.facing).scale(5)

  # Add events and methods here
  self.bind "update", ->
    I.facing = Point.direction(I, playerData)

    if I.age % 30 == 0
      shoot()

  self.bind "draw", ->
    canvas.withTransform Matrix.rotation(I.facing), ->
      turretTop.draw canvas, 0, 0

  # We must always return self as the last line
  return self
