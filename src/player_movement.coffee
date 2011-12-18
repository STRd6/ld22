PlayerMovement = (I={}, self) ->
  # Set some default properties
  Object.reverseMerge I,
    walkCycle: 0
    facing: Point(1, 0)

  # Add events and methods here
  self.bind "update", ->
    movement = Point(0, 0)

    if keydown.left
      movement = movement.add(Point(-1, 0))
    if keydown.right
      movement = movement.add(Point(1, 0))
    if keydown.up
      movement = movement.add(Point(0, -1))
    if keydown.down
      movement = movement.add(Point(0, 1))

    if movement.equal(Point(0, 0))
      I.velocity = movement
    else
      I.walkCycle += 1

      I.facing = movement.norm()
      I.velocity = I.facing.scale(I.speed)

      I.velocity.x.abs().times ->
        if !engine.collides(self.collisionBounds(I.velocity.x.sign(), 0), self)
          I.x += I.velocity.x.sign()
        else 
          I.velocity.x = 0

      I.velocity.y.abs().times ->
        if !engine.collides(self.collisionBounds(0, I.velocity.y.sign()), self)
          I.y += I.velocity.y.sign()
        else 
          I.velocity.y = 0

  return {}

