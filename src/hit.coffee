Hit = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    duration: 4
    color: "rgba(255, 255, 255, 0.5)"
    radius: 8

  # Inherit from game object
  self = Base(I)

  self.bind "create", ->
    Sound.play "hit"

  self.bind "update", ->
    Collision.collide "Box, Turret", self, (box) ->
      box.trigger "hit"

  # We must always return self as the last line
  return self

